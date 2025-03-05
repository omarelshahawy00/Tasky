// // lib/core/network/services/api_service_impl.dart
// import 'package:dio/dio.dart';
// import 'package:zbooma_to_do_app/core/cache/services/token_helper.dart'
//     show TokenStorage;
// import '../interfaces/i_api_service.dart';

// class ApiService implements IApiService {
//   final Dio _dio;
//   final TokenStorage _tokenStorage;
//   static String _currentLanguage = 'en';

//   ApiService({required Dio dio, required TokenStorage tokenStorage})
//     : _dio = dio,
//       _tokenStorage = tokenStorage;

//   Future<Options> _getOptionsWithToken(bool addToken) async {
//     Map<String, dynamic> headers = {'Accept-Language': _currentLanguage};

//     if (addToken) {
//       final token = await _tokenStorage.getAccessToken();
//       if (token != null) {
//         headers['Authorization'] = 'Bearer $token';
//       }
//     }

//     return Options(headers: headers);
//   }

//   @override
//   Future<dynamic> get({
//     required String endPoint,
//     bool addToken = false,
//     bool refreshCache = true,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final options = await _getOptionsWithToken(addToken);
//       final response = await _dio.get(
//         endPoint,
//         options: options,
//         queryParameters: queryParameters,
//       );
//       return response.data;
//     } on DioException catch (error) {
//       throw _handleDioError(error);
//     }
//   }

//   @override
//   Future<Map<String, dynamic>> post({
//     required String endPoint,
//     required Map<String, dynamic> data,
//     bool addToken = false,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final options = await _getOptionsWithToken(addToken);
//       final response = await _dio.post(
//         endPoint,
//         data: data,
//         options: options,
//         queryParameters: queryParameters,
//       );
//       return {'data': response.data, 'headers': response.headers.map};
//     } on DioException catch (error) {
//       throw _handleDioError(error);
//     }
//   }

//   @override
//   Future<Map<String, dynamic>> put({
//     required String endPoint,
//     required Map<String, dynamic> data,
//     bool addToken = false,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final options = await _getOptionsWithToken(addToken);
//       final response = await _dio.put(
//         endPoint,
//         data: data,
//         options: options,
//         queryParameters: queryParameters,
//       );
//       return response.data;
//     } on DioException catch (error) {
//       throw _handleDioError(error);
//     }
//   }

//   @override
//   Future<Map<String, dynamic>> delete({
//     required String endPoint,
//     bool addToken = false,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final options = await _getOptionsWithToken(addToken);
//       final response = await _dio.delete(
//         endPoint,
//         options: options,
//         queryParameters: queryParameters,
//       );
//       return response.data;
//     } on DioException catch (error) {
//       throw _handleDioError(error);
//     }
//   }

//   @override
//   Future<Map<String, dynamic>> uploadFile({
//     required String endPoint,
//     required FormData data,
//     bool addToken = false,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final options = await _getOptionsWithToken(addToken);
//       final response = await _dio.post(
//         endPoint,
//         data: data,
//         options: options,
//         queryParameters: queryParameters,
//       );
//       return response.data;
//     } on DioException catch (error) {
//       throw _handleDioError(error);
//     }
//   }

//   Exception _handleDioError(DioException error) {
//     return Exception(error.message ?? 'An error occurred');
//   }

//   static void setLanguage(String language) {
//     _currentLanguage = language;
//   }
// }
import 'package:dio/dio.dart';
import 'package:zbooma_to_do_app/core/network/config/api_config.dart';
import 'package:zbooma_to_do_app/core/network/constants/api_constant.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await _dio.get(
      "${ApiConfig.baseUrl}$endPoint",
      queryParameters: queryParameters,
      options: Options(
        method: 'GET',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': "Bearer ${await AppPreference.getUserToken()}",
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    var response = await _dio.post(
      queryParameters: queryParameters,
      "${ApiConfig.baseUrl}$endPoint",
      data: isFromData ? FormData.fromMap(data!) : data,
      options: Options(
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': "Bearer ${await AppPreference.getUserToken()}",
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    var response = await _dio.request(
      queryParameters: queryParameters,
      "${ApiConfig.baseUrl}$endPoint",
      data: isFromData ? FormData.fromMap(data!) : data,
      options: Options(
        method: 'PUT',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': "Bearer ${await AppPreference.getUserToken()}",
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    var response = await _dio.delete(
      "${ApiConfig.baseUrl}$endPoint",
      options: Options(
        method: 'DELETE',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': "Bearer ${await AppPreference.getUserToken()}",
        },
      ),
    );
    return response.data;
  }
}
