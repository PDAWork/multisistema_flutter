import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/login_entity.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/role_entity.dart';
import 'package:multisitema_flutter/features/auth/domain/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, RoleEntity>> signIn(LoginEntity loginEntity) async {
    return await _authRepository.signIn(loginEntity);
  }

  Either<Failure, bool> isLoginUser() => _authRepository.isLoginUser();
}
