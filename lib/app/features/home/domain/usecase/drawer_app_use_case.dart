import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/drawer_app_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/repository/drawer_app_repository.dart';

class DraweAppUseCase {
  final DrawerAppRepository _repository;

  DraweAppUseCase(this._repository);

  Future<Either<Failure, DrawerAppEntity>> call() async {
    return _repository.getData();
  }
}
