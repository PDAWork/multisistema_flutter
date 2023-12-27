import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/auth/domain/entity/login_entity.dart';
import 'package:multisitema_flutter/app/features/auth/domain/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, void>> signIn(LoginEntity loginEntity) async {
    return await _authRepository.signIn(loginEntity);
  }

  Either<Failure, bool> isLoginUser() => _authRepository.isLoginUser();
}
