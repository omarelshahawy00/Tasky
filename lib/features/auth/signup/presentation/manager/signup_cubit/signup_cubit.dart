import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/signup_request_model.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/signup_response_model.dart' show SignupResponseModel;
import 'package:zbooma_to_do_app/features/auth/data/repo/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> userSignup(SignupRequestModel signupRequestModel) async {
    emit(SignupLoading());
    final  result = await authRepo
        .userSignup(signupRequestModel);

    result.fold(
      (failure) => emit(SignupError(failure.errMessage)),
      (response) => emit(SignupSuccess(response)),
    );
  }
}
