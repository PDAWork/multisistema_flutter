import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/app/features/home/data/mapper/meter_body_mapper.dart';
import 'package:multisitema_flutter/app/features/home/data/mapper/sensor_mapper.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/meter_body_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/sensor_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final RemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SensorEntity>>> getMeter(
      MeterBodyEntity meterBody) async {
    try {
      final result = await remoteDataSource.getMeters(meterBody.toDto());
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
