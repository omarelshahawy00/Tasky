import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zbooma_to_do_app/core/di/di.dart';
import 'package:zbooma_to_do_app/features/auth/data/repo/auth_repo.dart';
import 'package:zbooma_to_do_app/features/auth/login/presentation/views/login_view.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/views/signup_view.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/add_new_task_view.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/home_view.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/profile_view.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/task_details_view.dart';

class Routes {
  static const String splashScreen = 'splashScreen';
  static const String onboardingScreen = 'onboardingScreen';
  static const String loginView = 'loginView';
  static const String signupView = 'signupView';
  static const String homeView = 'homeView';
  static const String taskDetailsView = 'taskDetailsScreen';
  static const String addNewTaskView = 'addNewTaskView';
  static const String profileView = 'profileView';

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
      case taskDetailsView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (context) => TaskDetailsView(
                title: args['title'],
                description: args['description'],
                status: args['status'],
                statusColor: args['statusColor'],
                priority: args['priority'],
                priorityColor: args['priorityColor'],
                date: args['date'],
                imagePath: args['imagePath'],
              ),
        );
      case addNewTaskView:
        return MaterialPageRoute(builder: (context) => AddNewTaskView());
      case profileView:
        return MaterialPageRoute(builder: (context) => ProfileView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
