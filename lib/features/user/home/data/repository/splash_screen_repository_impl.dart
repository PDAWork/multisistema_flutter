import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/hive/hive_local_data_source.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/shared_preferences/sp_local_data_source.dart';
import 'package:multisitema_flutter/features/user/home/domain/repository/splash_screen_repository.dart';

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
  Future<Either<Failure, Unit>> getOject({
    bool testIsInternet = false,
  }) async {
    try {
      if (testIsInternet) if (!testIsInternet) return const Right(unit);
      final objectList = await remoteDataSource.getObject();
      await hiveLocalDataSource.setObject(objectList);
      return const Right(unit);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  String getFirstName() => spLocalDataSource.getfirstName();
}
