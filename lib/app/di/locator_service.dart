import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:multisitema_flutter/app/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:multisitema_flutter/app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:multisitema_flutter/app/features/auth/data/repository/token_repository_impl.dart';
import 'package:multisitema_flutter/app/features/auth/domain/repository/auth_repository.dart';
import 'package:multisitema_flutter/app/features/auth/domain/repository/token_repository.dart';
import 'package:multisitema_flutter/app/features/auth/domain/usecase/auth_use_case.dart';
import 'package:multisitema_flutter/app/features/auth/domain/usecase/token_use_case.dart';
import 'package:multisitema_flutter/app/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/hive/hive_local_data_source.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/hive/hive_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/shared_preferences/sp_local_data_source.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/shared_preferences/sp_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/features/home/data/repository/splash_screen_repository_impl.dart';
import 'package:multisitema_flutter/app/features/home/domain/repository/splash_screen_repository.dart';
import 'package:multisitema_flutter/app/features/home/domain/usecase/splash_screen_use_case.dart';
import 'package:multisitema_flutter/app/features/home/presentation/cubit/splash_screen_cubit.dart';
import 'package:multisitema_flutter/app/features/information/presentation/information.dart';
import 'package:multisitema_flutter/app/core/network/api_entrypoints.dart';
import 'package:multisitema_flutter/app/core/network/interceptor_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocatorService() async {
  // Bloc/Cubit

  sl.registerFactory(() => PageViewProvider());

  sl.registerFactory(() => SignInCubit(authUseCase: sl()));

  sl.registerFactory(() => SplashScreenCubit(sl()));

  // UseCases

  sl.registerLazySingleton(() => AuthUseCase(sl()));
  sl.registerLazySingleton(() => TokenUseCase(sl()));

  sl.registerLazySingleton(() => SplashScreenUseCase(sl()));

  // Repository

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authLocalDataSource: sl(),
        authRemoteDataSource: sl(),
      ));

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<Dio>()),
  );

  sl.registerLazySingleton<TokenRepository>(
    () => TokenRepositoryImpl(
      sl(),
      sl(),
    ),
  );

  sl.registerLazySingleton<SplashScreenRepository>(
    () => SplashScreenRepositoryImpl(
      remoteDataSource: sl(),
      hiveLocalDataSource: sl(),
      spLocalDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<HiveLocalDataSource>(
      () => HiveLocalDataSourceImpl());
  sl.registerLazySingleton<SPLocalDataSource>(
      () => SPLocalDataSourceImpl(sl()));

  await sl<HiveLocalDataSource>().initDb();

  // External
  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);

  sl.registerLazySingleton(() {
    // Отменить PrettyDioLogger в release version kDebug
    return Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
      ),
    )..interceptors.addAll(
        [
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
          InterceptorApp(),
        ],
      );
  });
}
