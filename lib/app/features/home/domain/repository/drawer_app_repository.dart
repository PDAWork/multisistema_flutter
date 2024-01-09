import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/drawer_app_entity.dart';

abstract class DrawerAppRepository {
  Future<Either<Failure, DrawerAppEntity>> getData();
}
