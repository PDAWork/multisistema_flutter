import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/object_entity.dart';

abstract interface class DropdownButtonAppRepository {
  Future<Either<Failure, List<ObjectEntity>>> getObject();
}
