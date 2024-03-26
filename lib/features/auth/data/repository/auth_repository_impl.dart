import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:multisitema_flutter/core/error/exeption.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:multisitema_flutter/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:multisitema_flutter/features/auth/data/mapper/login_mapper.dart';
import 'package:multisitema_flutter/features/auth/data/mapper/role_mapper.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/login_entity.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/role_entity.dart';
import 'package:multisitema_flutter/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
    required this.firebaseMessaging,
  });

  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final FirebaseMessaging firebaseMessaging;

  @override
  Future<Either<Failure, RoleEntity>> signIn(LoginEntity loginEntity) async {
    try {
      final user = await authRemoteDataSource.signIn(loginEntity.toDto());
      final tokenDevise =
          await firebaseMessaging.getToken(vapidKey: dotenv.get('VAPID_KEY'));

      await authLocalDataSource.setUserProfile(user);
      await authRemoteDataSource.addTokenDevice(tokenDevise ?? "");
      return Right(user.idRole.toEntity());
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
