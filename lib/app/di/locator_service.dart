import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:multisitema_flutter/app/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:multisitema_flutter/app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:multisitema_flutter/app/features/auth/domain/repository/auth_repository.dart';
import 'package:multisitema_flutter/app/features/auth/domain/usecase/auth.dart';
import 'package:multisitema_flutter/app/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multisitema_flutter/app/features/information/presentation/information.dart';
import 'package:multisitema_flutter/app/core/network/api_entrypoints.dart';
import 'package:multisitema_flutter/app/core/network/interceptor_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocatorService() async {
  // Bloc/Cubit

  sl.registerFactory(() => SignInCubit(authUseCase: sl()));

  sl.registerFactory(() => PageViewProvider());

  // UseCases

  sl.registerLazySingleton(() => Auth(sl()));

  // Repository

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authLocalDataSource: sl(),
        authRemoteDataSource: sl(),
      ));

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

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
