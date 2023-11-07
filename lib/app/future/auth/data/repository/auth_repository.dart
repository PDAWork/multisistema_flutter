import 'package:multisitema_flutter/app/future/auth/data/dto/user_login_dto.dart';
import 'package:multisitema_flutter/utils/fauler.dart';

abstract interface class AuthRepository {
  Future<(Fauler, UserLoginDTO)> login(String password, String login);
}
