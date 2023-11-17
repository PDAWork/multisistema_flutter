import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisitema_flutter/app/core/hive_helper.dart';
import 'package:multisitema_flutter/app/core/hive_helper_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/repository/auth_repository_impl.dart';
import 'package:multisitema_flutter/app/future/auth/model/repository/auth_repository.dart';
import 'package:multisitema_flutter/app/future/auth/model/usecase/auth_use_cases.dart';
import 'package:multisitema_flutter/app/future/auth/ui/state/auth_cubit.dart';
import 'package:multisitema_flutter/app/future/home/ui/state/cubit/home_cubit.dart';
import 'package:multisitema_flutter/app/future/splashscreen/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/app/future/splashscreen/data/repository/splash_screen_repository_impl.dart';
import 'package:multisitema_flutter/app/future/splashscreen/ui/state/cubit/splash_screen_cubit.dart';
import 'package:multisitema_flutter/utils/api_entrypoints.dart';
import 'package:multisitema_flutter/utils/interceptor_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/future/splashscreen/data/data_source/remote_data_source_impl.dart';
import '../app/future/splashscreen/model/repository/splash_screen_repository.dart';

final sl = GetIt.instance;

Future<void> initLocatorService() async {
  // Bloc/Cubit

  sl.registerLazySingleton(() => HomeCubit(sl(), sl(), sl()));
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory(() => SplashScreenCubit(
        authLocalDataSource: sl(),
        splashScreenRepository: sl(),
      ));

  // UseCases

  sl.registerLazySingleton(() => AuthUseCases(authRepository: sl()));

  // Repository

  sl.registerLazySingleton<SplashScreenRepository>(
      () => SplashScreenRepositoryImpl(
            hiveHelper: sl(),
            remoteDataSource: sl(),
            authLocalDataSource: sl(),
          ));

  sl.registerLazySingleton<RemoteDataSource>(() => RemotedDataSourceImpl(sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authRemoteDataSource: sl(),
        authLocalDataSource: sl(),
      ));
  // Remote/Local
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  // External
  await Hive.initFlutter();
  sl.registerLazySingleton<HiveHelper>(() => HiveHelperImpl());
  await sl<HiveHelper>().init();

  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);

  final HttpClientAdapter httpClientAdapter = IOHttpClientAdapter(
    onHttpClientCreate: (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    },
  );

  sl.registerLazySingleton(() {
    // Отменить PrettyDioLogger в release version kDebug
    return Dio(BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 20), // миллисекунды
        receiveTimeout: const Duration(seconds: 60), // миллисекунды
        sendTimeout: const Duration(seconds: 20),
        headers: {
          "Accept": "application/json",
          'Connection': 'keep-alive',
        }))
      ..interceptors.addAll(
        [
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
          InterceptorApp(authLocalDataSourceImpl: sl()),
        ],
      )
      ..httpClientAdapter = httpClientAdapter;
  });
}
