import 'package:multisitema_flutter/app/data/dto/body_response.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';

import '../dto/user_login_dto.dart';

abstract interface class AuthRemoteDataSource {
  /// https://api.saures.ru/1.0/login
  Future<BodyResponse<UserLoginDTO>> login(
    String login,
    String password,
  );

  /// https://api.saures.ru/1.0/user/profile
  Future<BodyResponse<UserProfileDTO>> userProfile(String sid);

  Future<void> userRegister();
}
