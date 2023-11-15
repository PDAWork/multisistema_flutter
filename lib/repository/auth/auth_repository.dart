import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/common/fauler.dart';
import 'package:multisitema_flutter/core/local_data_source.dart';
import 'package:multisitema_flutter/core/remote_data_source.dart';
import 'package:multisitema_flutter/model/dto/user/user_login_dto.dart';
import 'package:multisitema_flutter/model/dto/user/user_profile_dto.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserLoginDTO>> login(String email, String password);

  Future<Either<Failure, UserProfileDTO>> userProfile(String sid);
}

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, UserProfileDTO>> login(
      String email, String password) async {
    try {
      final result = await remoteDataSource.onLogin(email, password);
      localDataSource.setSid(result.sid);

      return right(result.data);
    } on AuthorizationExeption catch (e) {
      return Left(AuthorizationFailure(message: e.message));
    } on ServerExeption catch (e) {
      return Left(AuthorizationFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserProfileDTO>> userProfile(String sid) {}
}
