import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/core/use_case/use_case.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/pay_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/repository/tariff_repository.dart';

class PayUseCase implements UseCase<Either<Failure, PayEntity>, PayParams> {
  final TariffRepository _tariffRepository;

  PayUseCase({required TariffRepository tariffRepository})
      : _tariffRepository = tariffRepository;

  @override
  Future<Either<Failure, PayEntity>> call(PayParams param) {
    return _tariffRepository.pay(
      param.tariffId,
      param.objectId,
    );
  }
}

final class PayParams {
  final int tariffId;
  final int objectId;

  PayParams({
    required this.tariffId,
    required this.objectId,
  });
}
