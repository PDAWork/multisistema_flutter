import 'package:multisitema_flutter/app/features/home/data/data_source/shared_preferences/sp_local_data_source.dart';
import 'package:multisitema_flutter/utils/key_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPLocalDataSourceImpl implements SPLocalDataSource {
  final SharedPreferences _sharedPreferences;

  SPLocalDataSourceImpl(this._sharedPreferences);

  @override
  String getfirstName() {
    print(_sharedPreferences.getString(KeySharedPreferences.keyFirstName));
    return _sharedPreferences.getString(KeySharedPreferences.keyFirstName) ??
        "Пользователь";
  }
}
