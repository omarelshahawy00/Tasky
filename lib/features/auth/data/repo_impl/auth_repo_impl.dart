import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:zbooma_to_do_app/core/errors/failures.dart';
import 'package:zbooma_to_do_app/core/network/constants/api_constant.dart';
import 'package:zbooma_to_do_app/core/network/services/api_service.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/signup_request_model.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/signup_response_model.dart';
import 'package:zbooma_to_do_app/features/auth/data/repo/auth_repo.dart'
    show AuthRepo;

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, SignupResponseModel>> userSignup(
    SignupRequestModel signupRequestModel,
  ) async {
    try {
      final response = await apiService.post(
        endPoint: ApiConstant.registerEndPoint,
        data: signupRequestModel.toJson(),
      );
      final result = SignupResponseModel.fromJson(response);
      if (result.id != null) {
        return Right(result);
      } else {
        return Left(ServerFailure(result.message.toString()));
      }
    } catch (error) {
      if (error is DioException) {
        return Left(_handleError(error));
      } else {
        log("Unexpected error in AuthRepositoryImpl: $error");
        return Left(
          ServerFailure("An unexpected error occurred: ${error.toString()}"),
        );
      }
    }
  }

  Failure _handleError(Object error) {
    if (error is DioException) {
      return ServerFailure.fromResponse(
        error.response?.statusCode,
        error.response?.data,
      );
    } else {
      log("Unexpected error in AuthRepositoryImpl: $error");
      return ServerFailure("An unexpected error occurred: ${error.toString()}");
    }
  }
}
