import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/repository/auth_repository_impl.dart';
import 'package:multisitema_flutter/app/future/auth/model/repository/auth_repository.dart';
import 'package:multisitema_flutter/app/future/auth/model/usecase/auth_use_cases.dart';
import 'package:multisitema_flutter/app/future/auth/ui/state/auth_cubit.dart';
import 'package:multisitema_flutter/utils/api_entrypoints.dart';
import 'package:multisitema_flutter/utils/interceptor_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocatorService() async {
/*
 //Bloc/Cubit

  sl.registerFactory(() => PersonListCubuit(getAllPersons: sl()));
  sl.registerFactory(() => PersonSearchBloc(searchPersons: sl()));

  //UseCases

  sl.registerLazySingleton(() => GetAllPersons(sl()));
  sl.registerLazySingleton(() => SearchPerson(sl()));
 */

  // Bloc/Cubit

  sl.registerFactory(() => AuthCubit(sl()));

  // UseCases

  sl.registerLazySingleton(() => AuthUseCases(authRepository: sl()));

  // Repository
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
  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);

  sl.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl, headers: {
      "Accept": "application/json",
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
        ],
      )
      ..interceptors.add(
        InterceptorApp(authLocalDataSourceImpl: sl()),
      ),
  );
}
