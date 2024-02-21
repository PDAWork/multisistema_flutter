import 'package:dartz/dartz.dart';

abstract interface class SPLocalDataSource {
  String getfirstName();
  String getEmail();
  Future<Unit> clearCache();
}
