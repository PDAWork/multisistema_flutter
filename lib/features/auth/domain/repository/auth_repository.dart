import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/login_entity.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/role_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, RoleEntity>> signIn(LoginEntity loginEntity);
  Either<Failure, bool> isLoginUser();
}
