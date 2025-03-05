// lib/core/network/dio/dio_factory.dart

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zbooma_to_do_app/core/network/config/api_config.dart';

class DioFactory {
  static final DioFactory _instance = DioFactory._internal();
  Dio? _dio;

  factory DioFactory() {
    return _instance;
  }

  DioFactory._internal();

  Future<Dio> getDio() async {
    if (_dio != null) return _dio!;

    _dio = Dio();
    await _configureDio();
    return _dio!;
  }

  Future<void> _configureDio() async {
    _dio!.options = BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: ApiConfig.connectTimeout),
      receiveTimeout: const Duration(seconds: ApiConfig.receiveTimeout),
      headers: ApiConfig.defaultHeaders,
      validateStatus: (status) => status != null && status < 500,
    );

    await _addInterceptors();
  }

  Future<void> _addInterceptors() async {
    _dio!.interceptors.addAll([
      await _createCacheInterceptor(),
      _createLoggerInterceptor(),
      _createErrorInterceptor(),
    ]);
  }

  Interceptor _createLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }

  Future<Interceptor> _createCacheInterceptor() async {
    final dir = await getApplicationDocumentsDirectory();
    final options = CacheOptions(
      store: HiveCacheStore(dir.path),
      policy: CachePolicy.refreshForceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 1),
      priority: CachePriority.normal,
    );
    return DioCacheInterceptor(options: options);
  }

  Interceptor _createErrorInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) {
        final customError = _handleError(error);
        handler.next(customError);
      },
    );
  }

  DioException _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return DioException(
          requestOptions: error.requestOptions,
          error: 'Connection timeout',
          type: error.type,
        );
      case DioExceptionType.badResponse:
        return _handleResponseError(error);
      default:
        return error;
    }
  }

  DioException _handleResponseError(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        return DioException(
          requestOptions: error.requestOptions,
          error: 'Bad request',
          response: error.response,
        );
      case 401:
        return DioException(
          requestOptions: error.requestOptions,
          error: 'Unauthorized',
          response: error.response,
        );
      case 404:
        return DioException(
          requestOptions: error.requestOptions,
          error: 'Not found',
          response: error.response,
        );
      default:
        return error;
    }
  }
}
