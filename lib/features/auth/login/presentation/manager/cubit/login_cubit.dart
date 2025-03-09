import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/login_models/login_request_model.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/login_models/login_response_model.dart';
import 'package:zbooma_to_do_app/features/auth/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> userLogin( LoginRequestModel loginRequestModel) async {
    emit(LoginLoading());
    final result = await authRepo.userLogin(loginRequestModel);
    result.fold((failure) => emit(LoginError(errMessage:  failure.errMessage)),
        (loginResponseModel) => emit(LoginSuccess(loginResponseModel:  loginResponseModel)));
  }
}
