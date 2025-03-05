// import 'package:dio/dio.dart';
// import 'package:hero_shop/core/errors/failures.dart';

// import 'models/api_error_model.dart';

// class ErrorHandler {
//   Failure handleError(Exception error) {
//     if (error is DioException) {
//       return ServerFailure.fromResponse(
//         error.response?.statusCode,
//         ApiErrorResponse.fromJson(error.response?.data),
//       );
//     }
//     return ServerFailure(error.toString());
//   }
// }
