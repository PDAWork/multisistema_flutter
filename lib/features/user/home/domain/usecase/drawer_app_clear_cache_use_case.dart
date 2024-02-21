import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/core/use_case/use_case.dart';
import 'package:multisitema_flutter/features/user/home/domain/repository/drawer_app_repository.dart';

class DrawerAppClearCacheUseCase
    implements UseCase<Either<Failure, Unit>, Unit> {
  final DrawerAppRepository _repository;

  DrawerAppClearCacheUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(Unit? param) async {
    return await _repository.clearCache();
  }
}
