import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_login_dto.dart';

import 'package:multisitema_flutter/utils/fauler.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<(Fauler, UserLoginDTO)> login(String password, String login) async {
    final resultLogin = await _authRemoteDataSource.login(
      login,
      password,
    );

    return (resultLogin.$1, resultLogin.$2.data);
  }
}
