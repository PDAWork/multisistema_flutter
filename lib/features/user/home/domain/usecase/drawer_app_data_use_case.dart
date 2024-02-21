import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/core/use_case/use_case.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/drawer_app_entity.dart';
import 'package:multisitema_flutter/features/user/home/domain/repository/drawer_app_repository.dart';

class DrawerAppDataUseCase
    implements UseCase<Either<Failure, DrawerAppEntity>, Unit> {
  final DrawerAppRepository _repository;

  DrawerAppDataUseCase(this._repository);

  @override
  Future<Either<Failure, DrawerAppEntity>> call(Unit? param) async {
    return _repository.getData();
  }
}
