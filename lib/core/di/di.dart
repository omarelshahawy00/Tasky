import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:zbooma_to_do_app/core/cache/services/cache_helper.dart';
import 'package:zbooma_to_do_app/core/cache/services/token_helper.dart'
    show TokenStorage;
import 'package:zbooma_to_do_app/core/connection/connection_info.dart'
    show NetworkInfo, NetworkInfoImpl;
import 'package:zbooma_to_do_app/core/network/dio_factory.dart';
import 'package:zbooma_to_do_app/core/network/services/api_service.dart';
import 'package:zbooma_to_do_app/core/utils/refresh_token_extractor.dart'
    show TokenExtractor;
import 'package:zbooma_to_do_app/features/auth/data/repo/auth_repo.dart';
import 'package:zbooma_to_do_app/features/auth/data/repo_impl/auth_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  Dio dio = await DioFactory().getDio();

  // Register TokenStorage first
  getIt.registerSingleton<TokenStorage>(TokenStorage());
  // Register ApiService
  getIt.registerSingleton<ApiService>(ApiService(dio));

  getIt.registerSingleton<TokenExtractor>(TokenExtractor());

  CacheHelper cacheHelper = CacheHelper();
  await cacheHelper.init();
  getIt.registerSingleton<CacheHelper>(cacheHelper);

  // // Register InternetConnectionCheckerPlus
  // getIt.registerSingleton<InternetConnection>(InternetConnection());

  getIt.registerSingleton<NetworkInfo>(
    NetworkInfoImpl(DataConnectionChecker()),
  );

  //-------------------------------PROFILE------------------------------------//

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(apiService: getIt<ApiService>()),
  );
}

// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:zbooma_to_do_app/core/cache/services/token_helper.dart';
// import 'package:zbooma_to_do_app/core/network/services/api_service.dart'
//     show ApiService;
// import 'package:zbooma_to_do_app/features/auth/data/repo/auth_repo.dart';
// import 'package:zbooma_to_do_app/features/auth/data/repo_impl/auth_repo_impl.dart'
//     show AuthRepoImpl;

// final getIt = GetIt.instance;

// void getitSetup() {
//   getIt.registerSingleton<TokenStorage>(TokenStorage());

//   getIt.registerSingleton<Dio>(Dio());

//   getIt.registerSingleton<ApiService>(
//     ApiService(dio: getIt<Dio>(), tokenStorage: getIt<TokenStorage>()),
//   );

//   getIt.registerSingleton<AuthRepo>(
//     AuthRepoImpl(apiService: getIt<ApiService>()),
//   );
// }
