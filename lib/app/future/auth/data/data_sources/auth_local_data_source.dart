import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';

abstract interface class AuthLocalDataSource {
  void setSid(String sid);

  String getSid();

  void setUserProfile(UserProfileDTO userProfileDTO);

  UserProfileDTO getUserProfile();
}
