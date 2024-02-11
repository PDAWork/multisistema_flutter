import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/core/use_case/use_case.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/repository/tariff_repository.dart';

class TariffUseCase
    implements UseCase<Either<Failure, List<TariffEntity>>, Unit> {
  final TariffRepository _tariffRepository;

  TariffUseCase({required TariffRepository tariffRepository})
      : _tariffRepository = tariffRepository;

  @override
  Future<Either<Failure, List<TariffEntity>>> call([Unit param = unit]) async =>
      _tariffRepository.getAllTariff();
}
