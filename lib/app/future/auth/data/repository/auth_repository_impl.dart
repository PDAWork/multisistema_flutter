import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_login_dto.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';

import 'package:multisitema_flutter/utils/fauler.dart';

import '../../model/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, UserLoginDTO>> login(
      String password, String login) async {
    try {
      final result = await authRemoteDataSource.login(login, password);
      authLocalDataSource.setLogin(login, password);
      authLocalDataSource.setSid(result.data.sid);
      return right(result.data);
    } on AuthorizationExeption catch (e) {
      return Left(AuthorizationFailure(message: e.message));
    } on ServerExeption catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserProfileDTO>> userProfile(String sid) async {
    try {
      final result = await authRemoteDataSource.userProfile(sid);
      authLocalDataSource.setUserProfile(result.data);

      return Right(result.data);
    } on AuthorizationExeption catch (e) {
      return Left(SidFailure(message: e.message));
    }
  }
}
