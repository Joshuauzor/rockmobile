import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rockapp/services/auth_service.dart';
import 'package:rockapp/services/home_service.dart';

import 'core/networks/api_request.dart';
import 'core/networks/connectivity_info.dart';

GetIt sl = GetIt.instance;
Future<void> setupsl() async {
  sl.registerLazySingleton(() => Connectivity());

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ConnectivityInfo>(
    () => ConnectivityInfoImpl(),
  );

  sl.registerLazySingleton(() => ApiServiceRequester(dio: sl()));

  //Services
  sl.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceImpl());

  sl.registerLazySingleton<HomeService>(() => HomeServiceImpl());
}
