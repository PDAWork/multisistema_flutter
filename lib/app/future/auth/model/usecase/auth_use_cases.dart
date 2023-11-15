import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_login_dto.dart';
import 'package:multisitema_flutter/app/future/auth/model/repository/auth_repository.dart';
import 'package:multisitema_flutter/common/fauler.dart';

class AuthUseCases {
  final AuthRepository authRepository;

  AuthUseCases({required this.authRepository});

  Future<Either<Failure, UserLoginDTO>> login(
    String email,
    String password,
  ) async {
    final result = await authRepository.login(password, email);

    result.fold((l) => l, (r) async {
      await authRepository.userProfile(r.sid);
    });
    return result;
  }
}
