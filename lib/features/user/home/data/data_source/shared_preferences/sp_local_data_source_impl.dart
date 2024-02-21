import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/exeption.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/shared_preferences/sp_local_data_source.dart';
import 'package:multisitema_flutter/core/utils/key_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPLocalDataSourceImpl implements SPLocalDataSource {
  final SharedPreferences _sharedPreferences;

  SPLocalDataSourceImpl(this._sharedPreferences);

  @override
  String getfirstName() {
    try {
      return _sharedPreferences.getString(KeySharedPreferences.keyFirstName) ??
          "Пользователь";
    } catch (_) {
      throw ChacheException();
    }
  }

  @override
  String getEmail() {
    try {
      return _sharedPreferences.getString(KeySharedPreferences.keyLogin) ??
          "Почта пользователя";
    } catch (_) {
      throw ChacheException();
    }
  }

  @override
  Future<Unit> clearCache() async {
    try {
      await _sharedPreferences.clear();
      return unit;
    } catch (_) {
      throw ChacheException();
    }
  }
}
