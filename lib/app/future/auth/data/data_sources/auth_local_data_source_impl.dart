import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  SharedPreferences _preferences;

  final String _keySid = 'SID';
  final String _keyEmail = 'EMAIL';
  final String _keyFirstName = 'FIRSTNAME';
  final String _keyLastName = 'LASTNAME';
  final String _keyPhone = 'PHONE';

  AuthLocalDataSourceImpl(SharedPreferences preferences)
      : _preferences = preferences;

  @override
  String getSid() {
    return _preferences.getString(_keySid) ?? '';
  }

  @override
  UserProfileDTO getUserProfile() {
    final String email = _preferences.getString(_keyEmail) ?? "";
    final String firstName = _preferences.getString(_keyFirstName) ?? "";
    final String lastName = _preferences.getString(_keyLastName) ?? "";
    final String phone = _preferences.getString(_keyPhone) ?? "";
    return UserProfileDTO(
        email: email, firstName: firstName, lastName: lastName, phone: phone);
  }

  @override
  void setSid(String sid) {
    if (!sid.contains(''))
      _preferences.setString(_keySid, sid);
    else
      _preferences.remove(_keySid);
  }

  @override
  void setUserProfile(UserProfileDTO userProfileDTO) {
    _preferences
      ..setString(_keyEmail, userProfileDTO.email)
      ..setString(_keyFirstName, userProfileDTO.firstName)
      ..setString(_keyLastName, userProfileDTO.lastName)
      ..setString(_keyPhone, userProfileDTO.phone);
  }
}
