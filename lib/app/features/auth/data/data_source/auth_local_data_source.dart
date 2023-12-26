import 'package:multisitema_flutter/app/features/auth/data/model/user_dto.dart';
import 'package:multisitema_flutter/utils/key_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthLocalDataSource {
  Future<void> setUserProfile(UserDto userDto);
  bool isLoginUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _preferences;

  AuthLocalDataSourceImpl(this._preferences);

  @override
  Future<void> setUserProfile(UserDto userDto) async {
    // DOTO подумать что сделать с ключами
    await Future.wait({
      _preferences.setString(
        KeySharedPreferences.keyLogin,
        userDto.login,
      ),
      _preferences.setString(
        KeySharedPreferences.keyLastName,
        userDto.lastName,
      ),
      _preferences.setString(
        KeySharedPreferences.keyFirstName,
        userDto.firstName,
      ),
      _preferences.setString(
        KeySharedPreferences.keyPhone,
        userDto.phone,
      ),
      _preferences.setString(
        KeySharedPreferences.keyRefreshToken,
        userDto.refreshToken,
      ),
    });
  }

  @override
  bool isLoginUser() =>
      _preferences.getString(KeySharedPreferences.keyLogin) != null;
}
