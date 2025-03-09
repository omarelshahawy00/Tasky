import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zbooma_to_do_app/core/network/dio_factory.dart';
import 'package:zbooma_to_do_app/core/network/services/api_service.dart';
import 'package:zbooma_to_do_app/features/auth/data/repo/auth_repo.dart';
import 'package:zbooma_to_do_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:zbooma_to_do_app/features/home/data/repos/home_repo/home_repo.dart';
import 'package:zbooma_to_do_app/features/home/data/repos/home_rpeo_impl/home_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<DioFactory>(DioFactory());

  final dio = getIt<DioFactory>().dio;

  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));

  //-------------------------------PROFILE------------------------------------//

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(apiService: getIt<ApiService>()),
  );
}
