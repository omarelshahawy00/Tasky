import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zbooma_to_do_app/core/di/di.dart';
import 'package:zbooma_to_do_app/core/network/services/api_service.dart';
import 'package:zbooma_to_do_app/features/auth/data/repo/auth_repo.dart';
import 'package:zbooma_to_do_app/features/auth/login/presentation/views/login_view.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/views/signup_view.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/home_view.dart';

class Routes {
  static const String splashScreen = 'splashScreen';
  static const String onboardingScreen = 'onboardingScreen';
  static const String loginView = 'loginView';
  static const String signupView = 'signupView';
  static const String homeView = 'homeView';
  static const String productScreen = 'productScreen';
  static const String bestSellingScreen = 'bestSellingScreen';
  static const String cartScreen = 'cartScreen';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginView:
        return MaterialPageRoute(builder: (context) => LoginView());
      case signupView:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => SignupCubit(getIt.get<AuthRepo>()),
                child: SignupView(),
              ),
        );
      case homeView:
        return MaterialPageRoute(builder: (context) => HomeView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
