import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/features/home/data/model/object_dto.dart';

abstract interface class HiveLocalDataSource {
  Future<bool> initDb();
  Future<Unit> setObject(List<ObjectDto> model);
  Future<List<ObjectDto>> getObject();
}
