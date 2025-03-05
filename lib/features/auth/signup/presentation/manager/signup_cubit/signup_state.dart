part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final SignupResponseModel response;

  SignupSuccess(this.response);
}

class SignupError extends SignupState {
  final String failure;

  SignupError(this.failure);
}
