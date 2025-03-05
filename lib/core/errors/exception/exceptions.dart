// import 'package:dio/dio.dart';
// import 'package:hero_shop/core/errors/models/api_error_model.dart';

// //!ServerException
// class ServerException implements Exception {
//   final ApiErrorResponse errorModel;
//   ServerException(this.errorModel);
// }

// //!CacheExeption
// class CacheException implements Exception {
//   final String errorMessage;
//   CacheException({required this.errorMessage});
// }

// class BadCertificateException extends ServerException {
//   BadCertificateException(super.errorModel);
// }

// class ConnectionTimeoutException extends ServerException {
//   ConnectionTimeoutException(super.errorModel);
// }

// class BadResponseException extends ServerException {
//   BadResponseException(super.errorModel);
// }

// class ReceiveTimeoutException extends ServerException {
//   ReceiveTimeoutException(super.errorModel);
// }

// class ConnectionErrorException extends ServerException {
//   ConnectionErrorException(
//     super.errorModel,
//   );
// }

// class SendTimeoutException extends ServerException {
//   SendTimeoutException(super.errorModel);
// }

// class UnauthorizedException extends ServerException {
//   UnauthorizedException(super.errorModel);
// }

// class ForbiddenException extends ServerException {
//   ForbiddenException(super.errorModel);
// }

// class NotFoundException extends ServerException {
//   NotFoundException(super.errorModel);
// }

// class CofficientException extends ServerException {
//   CofficientException(super.errorModel);
// }

// class CancelException extends ServerException {
//   CancelException(super.errorModel);
// }

// class UnknownException extends ServerException {
//   UnknownException(super.errorModel);
// }

// handleDioException(DioException e) {
//   switch (e.type) {
//     case DioExceptionType.connectionError:
//       throw ConnectionErrorException(ApiErrorResponse.fromJson(
//           e.response?.data ?? "Connection Error Exception"));
//     case DioExceptionType.badCertificate:
//       throw BadCertificateException(
//           ApiErrorResponse.fromJson(e.response?.data ?? "Bad"));
//     case DioExceptionType.connectionTimeout:
//       throw ConnectionTimeoutException(
//           ApiErrorResponse.fromJson(e.response?.data ?? "Connection"));

//     case DioExceptionType.receiveTimeout:
//       throw ReceiveTimeoutException(
//           ApiErrorResponse.fromJson(e.response?.data ?? "Receiver Time out"));

//     case DioExceptionType.sendTimeout:
//       throw SendTimeoutException(
//           ApiErrorResponse.fromJson(e.response?.data ?? "Send Timeout"));

//     case DioExceptionType.badResponse:
//       switch (e.response?.statusCode) {
//         case 400: // Bad request
//           throw BadResponseException(
//               ApiErrorResponse.fromJson(e.response?.data ?? "Bad Response"));

//         case 401: //unauthorized
//           throw UnauthorizedException(
//               ApiErrorResponse.fromJson(e.response?.data ?? "Unauthorized"));

//         case 403: //forbidden
//           throw ForbiddenException(
//               ApiErrorResponse.fromJson(e.response?.data ?? "Forbidden"));

//         case 404: //not found
//           throw NotFoundException(
//               ApiErrorResponse(message: "Error 404", status: false));

//         case 409: //cofficient

//           throw CofficientException(
//               ApiErrorResponse.fromJson(e.response?.data ?? "Cofficient"));

//         case 504: // Bad request

//           throw BadResponseException(ApiErrorResponse(
//               status: false, message: e.response?.data ?? "Bad Response"));
//       }

//     case DioExceptionType.cancel:
//       throw CancelException(
//           ApiErrorResponse(message: e.toString(), status: false));

//     case DioExceptionType.unknown:
//       throw UnknownException(
//           ApiErrorResponse(message: e.toString(), status: false));
//   }
// }
