import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../utils/key_shared_preferences.dart';

abstract interface class AuthLocalDataSource {
  void setSid(String sid);

  String getSid();

  void setUserProfile(UserProfileDTO userProfileDTO);

  UserProfileDTO getUserProfile();

  void setLogin(String email, String password);

  (String email, String password) getLogin();

  bool getAuthUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _preferences;

  AuthLocalDataSourceImpl(this._preferences);

  @override
  String getSid() {
    return _preferences.getString(KeySharedPreferences.keySid) ?? '';
  }

  @override
  UserProfileDTO getUserProfile() {
    final String email =
        _preferences.getString(KeySharedPreferences.keyEmail) ?? "";
    final String firstName =
        _preferences.getString(KeySharedPreferences.keyFirstName) ?? "";
    final String lastName =
        _preferences.getString(KeySharedPreferences.keyLastName) ?? "";
    final String phone =
        _preferences.getString(KeySharedPreferences.keyPhone) ?? "";
    return UserProfileDTO(
        email: email, firstName: firstName, lastName: lastName, phone: phone);
  }

  @override
  void setSid(String sid) {
    sid.contains('')
        ? _preferences.setString(KeySharedPreferences.keySid, sid)
        : _preferences.remove(KeySharedPreferences.keySid);
  }

  @override
  void setUserProfile(UserProfileDTO userProfileDTO) {
    _preferences
      ..setString(KeySharedPreferences.keyFirstName, userProfileDTO.firstName)
      ..setString(KeySharedPreferences.keyLastName, userProfileDTO.lastName)
      ..setString(KeySharedPreferences.keyPhone, userProfileDTO.phone);
  }

  @override
  void setLogin(String email, String password) {
    _preferences
      ..setString(KeySharedPreferences.keyEmail, email)
      ..setString(KeySharedPreferences.keyPassword, password);
  }

  @override
  (String email, String password) getLogin() {
    return (
      _preferences.getString(KeySharedPreferences.keyEmail) ?? "",
      _preferences.getString(KeySharedPreferences.keyPassword) ?? ""
    );
  }

  @override
  bool getAuthUser() {
    return _preferences.getString(KeySharedPreferences.keyEmail) != null;
  }
}
