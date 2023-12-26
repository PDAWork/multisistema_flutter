import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/features/auth/domain/entity/login_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> signIn(LoginEntity loginEntity);
  Future<Either<Failure, void>> refresh(String token);
  Either<Failure, bool> isLoginUser();
}
