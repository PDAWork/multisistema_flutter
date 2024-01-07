import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/meter_body_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/sensor_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<SensorEntity>>> getMeter(
      MeterBodyEntity meterBodyEntity);
}
