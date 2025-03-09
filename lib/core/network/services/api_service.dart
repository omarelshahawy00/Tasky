import 'package:dio/dio.dart';
import 'package:zbooma_to_do_app/core/helpers/app_prefs.dart';
import 'package:zbooma_to_do_app/core/network/config/api_config.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await _dio.get(
      "${ApiConfig.baseUrl}$endPoint",
      queryParameters: queryParameters,
      options: Options(headers: await _getHeaders()),
    );
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    Response response = await _dio.post(
      "${ApiConfig.baseUrl}$endPoint",
      data: isFromData ? FormData.fromMap(data!) : data,
      queryParameters: queryParameters,
      options: Options(headers: await _getHeaders()),
    );
    return response.data;
  }

  Future<Map<String, String>> _getHeaders() async {
    final token = await AppPreference.getUserToken(); // Fetch the token
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': "Bearer $token",
    };
  }
}
