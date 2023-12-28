import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/object_entity.dart';

abstract interface class DropdownButtonAppRepository {
  Future<Either<Failure, List<ObjectEntity>>> getObject();
}
