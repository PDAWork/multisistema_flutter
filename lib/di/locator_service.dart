import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:multisitema_flutter/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:multisitema_flutter/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:multisitema_flutter/features/auth/data/repository/auth_repository_impl.dart';
import 'package:multisitema_flutter/features/auth/data/repository/token_repository_impl.dart';
import 'package:multisitema_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:multisitema_flutter/features/auth/domain/repository/token_repository.dart';
import 'package:multisitema_flutter/features/auth/domain/usecase/auth_use_case.dart';
import 'package:multisitema_flutter/features/auth/domain/usecase/token_use_case.dart';
import 'package:multisitema_flutter/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/hive/hive_local_data_source.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/hive/hive_local_data_source_impl.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/shared_preferences/sp_local_data_source.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/shared_preferences/sp_local_data_source_impl.dart';
import 'package:multisitema_flutter/features/user/home/data/repository/drop_down_button_app_repository_impl.dart';
import 'package:multisitema_flutter/features/user/home/data/repository/home_repository_impl.dart';
import 'package:multisitema_flutter/features/user/home/data/repository/splash_screen_repository_impl.dart';
import 'package:multisitema_flutter/features/user/home/domain/repository/drop_down_button_app_repository.dart';
import 'package:multisitema_flutter/features/user/home/domain/repository/home_repository.dart';
import 'package:multisitema_flutter/features/user/home/domain/repository/splash_screen_repository.dart';
import 'package:multisitema_flutter/features/user/home/domain/usecase/drop_down_button_app_use_case.dart';
import 'package:multisitema_flutter/features/user/home/domain/usecase/home_use_case.dart';
import 'package:multisitema_flutter/features/user/home/domain/usecase/splash_screen_use_case.dart';
import 'package:multisitema_flutter/features/user/home/presentation/bloc/drop_down_button_app/drop_down_button_app_bloc.dart';
import 'package:multisitema_flutter/features/user/home/presentation/bloc/home/home_bloc.dart';
import 'package:multisitema_flutter/features/user/home/presentation/cubit/splash_screen/splash_screen_cubit.dart';
import 'package:multisitema_flutter/features/user/information/presentation/information.dart';
import 'package:multisitema_flutter/core/network/api_entrypoints.dart';
import 'package:multisitema_flutter/core/network/interceptor_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final service = GetIt.instance;

Future<void> initLocatorService() async {
  // Bloc/Cubit

  service.registerFactory(() => PageViewProvider());

  service.registerFactory(() => SignInCubit(authUseCase: service()));

  service.registerFactory(() => SplashScreenCubit(service()));

  service.registerFactory(() => DropDownButtonAppBloc(service()));

  service.registerFactory(() => HomeBloc(service<HomeUseCase>()));

  // UseCases

  service.registerLazySingleton(() => AuthUseCase(service()));
  service.registerLazySingleton(() => TokenUseCase(service()));

  service.registerLazySingleton(() => SplashScreenUseCase(service()));

  service.registerLazySingleton(() => DropdownButtonAppUseCase(service()));

  service.registerLazySingleton(() => HomeUseCase(service()));

  // Repository

  service.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authLocalDataSource: service(),
        authRemoteDataSource: service(),
      ));

  service.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(service()),
  );
  service.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(service<Dio>()),
  );

  service.registerLazySingleton<TokenRepository>(
    () => TokenRepositoryImpl(
      service(),
      service(),
    ),
  );

  service.registerLazySingleton<SplashScreenRepository>(
    () => SplashScreenRepositoryImpl(
      remoteDataSource: service(),
      hiveLocalDataSource: service(),
      spLocalDataSource: service(),
    ),
  );

  service.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(service<Dio>()));
  service.registerLazySingleton<HiveLocalDataSource>(
      () => HiveLocalDataSourceImpl());
  service.registerLazySingleton<SPLocalDataSource>(
      () => SPLocalDataSourceImpl(service()));

  service.registerLazySingleton<DropdownButtonAppRepository>(
      () => DropdownButtonAppRepositoryImpl(hiveLocalDataSource: service()));

  service.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: service()));

  await service<HiveLocalDataSource>().initDb();

  // External
  final preferences = await SharedPreferences.getInstance();
  service.registerLazySingleton(() => preferences);

  service.registerLazySingleton(() {
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
