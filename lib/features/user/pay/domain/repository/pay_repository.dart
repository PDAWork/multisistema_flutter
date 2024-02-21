import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/pay_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_object_entity.dart';

abstract interface class PayRepository {
  Future<Either<Failure, List<TariffEntity>>> getAllTariff();
  Future<Either<Failure, PayEntity>> pay(int tariffId, int objectId);
  Future<Either<Failure, List<TariffObjectEntity>>> getAllTariffObject();
}
