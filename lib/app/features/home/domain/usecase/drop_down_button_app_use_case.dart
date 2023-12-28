import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/object_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/repository/drop_down_button_app_repository.dart';

class DropdownButtonAppUseCase {
  final DropdownButtonAppRepository _repository;

  DropdownButtonAppUseCase(this._repository);

  Future<Either<Failure, List<ObjectEntity>>> call() async {
    return await _repository.getObject();
  }
}
