import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/hive/hive_local_data_source.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/app/features/home/data/data_source/shared_preferences/sp_local_data_source.dart';
import 'package:multisitema_flutter/app/features/home/data/mapper/object_mapper.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/object_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/repository/splash_screen_repository.dart';

class SplashScreenRepositoryImpl implements SplashScreenRepository {
  SplashScreenRepositoryImpl({
    required this.remoteDataSource,
    required this.hiveLocalDataSource,
    required this.spLocalDataSource,
  });

  final HiveLocalDataSource hiveLocalDataSource;
  final RemoteDataSource remoteDataSource;
  final SPLocalDataSource spLocalDataSource;

  @override
  Future<Either<Failure, List<ObjectEntity>>> getOject({
    bool testIsInternet = false,
  }) async {
    try {
      final objectList = testIsInternet
          ? await remoteDataSource.getObject()
          : await hiveLocalDataSource.getObject();
      if (testIsInternet) hiveLocalDataSource.setObject(objectList);
      return Right(objectList.map((e) => e.toEntity()).toList());
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  String getFirstName() => spLocalDataSource.getfirstName();
}
