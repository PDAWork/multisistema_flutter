import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:multisitema_flutter/utils/locator_service.dart';

Future<String> mainLogin() async {
  AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl(
    sl<Dio>(),
    sl<AuthLocalDataSourceImpl>(),
  );

  final result = await authRemoteDataSource.login('demo@saures.ru', 'dmo');

  print(result.$1.message);
  print(result.$2.data.toString());
  return result.$2.data.sid;
}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await initLocatorService();
  AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl(
    sl<Dio>(),
    sl<AuthLocalDataSourceImpl>(),
  );
  final sid = await mainLogin();

  final result = await authRemoteDataSource.userProfile(sid);
  test(
    'Profile not null',
    () => expect(
      'demo@saures.ru',
      result.$2.data.email,
    ),
  );

  print(result.$1.message);
  print(result.$2.data.toString());
}
