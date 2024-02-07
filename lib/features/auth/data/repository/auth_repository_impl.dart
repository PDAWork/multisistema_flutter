import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/exeption.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:multisitema_flutter/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:multisitema_flutter/features/auth/data/mapper/login_mapper.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/login_entity.dart';
import 'package:multisitema_flutter/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  @override
  Future<Either<Failure, void>> signIn(LoginEntity loginEntity) async {
    try {
      final user = await authRemoteDataSource.signIn(loginEntity.toDto());
      return Right(await authLocalDataSource.setUserProfile(user));
    } on ServerException {
      return Left(ServerFailure());
    } on UserException catch (error) {
      return Left(UserFailure(errorMessage: error.errorMessage));
    }
  }

  @override
  Either<Failure, bool> isLoginUser() {
    try {
      return right(authLocalDataSource.isLoginUser());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
