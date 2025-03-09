import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Import this for kDebugMode
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zbooma_to_do_app/core/network/config/api_config.dart';

class DioFactory {
  static final DioFactory _instance = DioFactory._internal();
  late final Dio _dio;

  factory DioFactory() => _instance;

  DioFactory._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: Duration(seconds: ApiConfig.connectTimeout),
        receiveTimeout: Duration(seconds: ApiConfig.receiveTimeout),
        headers: ApiConfig.defaultHeaders,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    // Add logger only in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(_createLoggerInterceptor());
    }
  }

  Dio get dio => _dio;

  Interceptor _createLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }
}
