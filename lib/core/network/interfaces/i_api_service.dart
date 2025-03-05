// lib/core/network/interfaces/i_api_service.dart

import 'package:dio/dio.dart';

abstract class IApiService {
  Future<dynamic> get({
    required String endPoint,
    bool addToken = false,
    bool refreshCache = true,
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
    bool addToken = false,
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
    bool addToken = false,
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    bool addToken = false,
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> uploadFile({
    required String endPoint,
    required FormData data,
    bool addToken = false,
    Map<String, dynamic>? queryParameters,
  });
}
