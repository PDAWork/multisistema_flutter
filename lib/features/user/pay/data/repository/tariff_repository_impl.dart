import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/exeption.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/user/pay/data/data_source/tariff_remote_data_source.dart';
import 'package:multisitema_flutter/features/user/pay/data/mapper/pay_mapper.dart';
import 'package:multisitema_flutter/features/user/pay/data/mapper/tariff_mapper.dart';
import 'package:multisitema_flutter/features/user/pay/data/mapper/tariff_object_mapper.dart';
import 'package:multisitema_flutter/features/user/pay/data/model/pay_dto.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/pay_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_object_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/repository/pay_repository.dart';

final class TariffRepositoryImpl implements PayRepository {
  final TariffRemoteDataSource remoteDataSource;

  TariffRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TariffEntity>>> getAllTariff() async {
    try {
      final data = await remoteDataSource.getAllTariff();
      final tariffListEntity = data.map((e) => e.toEntity()).toList();
      return right(tariffListEntity);
    } on ServerException catch (_) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PayEntity>> pay(int tariffId, int objectId) async {
    try {
      final payModel = await remoteDataSource
          .pay(PayDto(tariffId: tariffId, objectId: objectId));
      return right(payModel.toEntity());
    } on ServerException catch (_) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TariffObjectEntity>>> getAllTariffObject() async {
    try {
      final tariffObjectModel = await remoteDataSource.getAllTariffObject();
      final data = tariffObjectModel.map((e) => e.toEntity()).toList();
      return right(data);
    } catch (_) {
      return left(ServerFailure());
    }
  }
}
