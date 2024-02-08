import 'package:multisitema_flutter/di/locator_service.dart';
import 'package:multisitema_flutter/core/utils/key_shared_preferences.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/role_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  bool _isLogin = false;
  bool get isLoginGet => _isLogin;

  int _role = 0;
  RoleEntity get role => RoleEntity.values[_role];

  AuthProvider() {
    _isLogin =
        service<SharedPreferences>().get(KeySharedPreferences.keyLogin) != null;

    _role =
        service<SharedPreferences>().getInt(KeySharedPreferences.keyRole) ?? 0;
  }
}
