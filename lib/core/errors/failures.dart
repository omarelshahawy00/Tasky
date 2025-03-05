import 'package:dio/dio.dart';

import 'models/api_error_model.dart';

class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        if (dioError.response != null && dioError.response?.data != null) {
          try {
            // Safely parse the response into ApiErrorResponse
            final apiError = ApiErrorResponse.fromJson(
              dioError.response?.data as Map<String, dynamic>,
            );
            return ServerFailure.fromResponse(
              dioError.response?.statusCode,
              apiError,
            );
          } catch (e) {
            // Fallback for parsing error
            return ServerFailure(
              dioError.response?.data["message"] ??
                  'Unknown error occurred while parsing server response',
            );
          }
        }
        return ServerFailure('Invalid response from ApiServer');

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');

      default:
        return ServerFailure('Oops! There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(
    int? statusCode,
    ApiErrorResponse response,
  ) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {
      return ServerFailure(response.message.toString());
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
