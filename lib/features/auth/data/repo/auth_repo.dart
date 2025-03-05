import 'package:dartz/dartz.dart';
import 'package:zbooma_to_do_app/core/errors/failures.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/signup_request_model.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/signup_response_model.dart';

abstract class AuthRepo {
    Future<Either<Failure, SignupResponseModel>> userSignup(SignupRequestModel signupRequestModel);
}