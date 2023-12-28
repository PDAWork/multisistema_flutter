import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/exeption.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/hive/hive_local_data_source.dart';
import 'package:multisitema_flutter/app/features/home/data/mapper/object_mapper.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/object_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/repository/drop_down_button_app_repository.dart';

class DropdownButtonAppRepositoryImpl implements DropdownButtonAppRepository {
  final HiveLocalDataSource hiveLocalDataSource;

  DropdownButtonAppRepositoryImpl({required this.hiveLocalDataSource});

  @override
  Future<Either<Failure, List<ObjectEntity>>> getObject() async {
    try {
      final objectList = await hiveLocalDataSource.getObject();
      return Right(objectList.map((e) => e.toEntity()).toList());
    } on HiveDataException {
      return Left(HiveDataFailure());
    } catch (_) {
      return Left(CacheFailure());
    }
  }
}
