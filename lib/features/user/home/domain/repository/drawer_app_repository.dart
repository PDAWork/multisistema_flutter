import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/drawer_app_entity.dart';

abstract class DrawerAppRepository {
  Either<Failure, DrawerAppEntity> getData();
  Future<Either<Failure, Unit>> clearCache();
}
