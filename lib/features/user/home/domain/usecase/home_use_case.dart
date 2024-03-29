import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/meter_body_entity.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/sensor_entity.dart';
import 'package:multisitema_flutter/features/user/home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  Future<Either<Failure, List<SensorEntity>>> call(
      MeterBodyEntity request) async {
    return await _homeRepository.getMeter(request);
  }
}
