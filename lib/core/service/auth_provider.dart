import 'package:multisitema_flutter/di/locator_service.dart';
import 'package:multisitema_flutter/core/utils/key_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  bool _isLogin = false;
  bool get isLoginGet => _isLogin;
  AuthProvider() {
    _isLogin =
        service<SharedPreferences>().get(KeySharedPreferences.keyLogin) != null;
  }
}
