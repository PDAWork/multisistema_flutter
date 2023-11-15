import 'package:multisitema_flutter/common/key_shared_preferences.dart';
import 'package:multisitema_flutter/model/dto/user/user_profile_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalDataSource {
  void setSid(String id);
  String getSid();

  void setUserProfile(
    String email,
    String password,
    String firstName,
    String lastName,
    String phone,
  );

  UserProfileDTO getUserProfile();

  (String email, String password) getLogin();

  bool getAuthUser();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences _preferences;

  LocalDataSourceImpl(this._preferences);
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
  void setUserProfile(
    String email,
    String password,
    String firstName,
    String lastName,
    String phone,
  ) {
    _preferences
      ..setString(KeySharedPreferences.keyFirstName, firstName)
      ..setString(KeySharedPreferences.keyLastName, lastName)
      ..setString(KeySharedPreferences.keyPhone, phone)
      ..setString(KeySharedPreferences.keyEmail, email)
      ..setString(KeySharedPreferences.keyPassword, password);
  }

  @override
  (String, String) getLogin() {
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
