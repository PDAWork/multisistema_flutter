import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/core/use_case/use_case.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_object_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/repository/pay_repository.dart';

class TarifObjectUseCase
    implements UseCase<Either<Failure, List<TariffObjectEntity>>, Unit> {
  TarifObjectUseCase({required PayRepository repository})
      : _repository = repository;
  final PayRepository _repository;

  @override
  Future<Either<Failure, List<TariffObjectEntity>>> call(Unit param) =>
      _repository.getAllTariffObject();
}
