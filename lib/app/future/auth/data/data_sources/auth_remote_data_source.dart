import 'package:multisitema_flutter/app/data/dto/body_response.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';
import 'package:multisitema_flutter/utils/fauler.dart';

import '../dto/user_login_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<(Fauler, BodyResponse<UserLoginDTO>)> login(
    String login,
    String password,
  );
  Future<(Fauler, BodyResponse<UserProfileDTO>)> userProfile(String sid);
  Future<void> userRegister();
}
