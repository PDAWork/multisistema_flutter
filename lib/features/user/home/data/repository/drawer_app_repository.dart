import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/core/error/failure.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/hive/hive_local_data_source.dart';
import 'package:multisitema_flutter/features/user/home/data/data_source/shared_preferences/sp_local_data_source.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/drawer_app_entity.dart';
import 'package:multisitema_flutter/features/user/home/domain/repository/drawer_app_repository.dart';

class DrawerAppRepositoryImpl implements DrawerAppRepository {
  final SPLocalDataSource spLocal;
  final HiveLocalDataSource hiveLocalDataSource;

  DrawerAppRepositoryImpl({
    required this.spLocal,
    required this.hiveLocalDataSource,
  });

  @override
  Either<Failure, DrawerAppEntity> getData() {
    try {
      final String email = spLocal.getEmail();
      final String fristName = spLocal.getfirstName();
      return right(DrawerAppEntity(
        fristName: fristName,
        email: email,
        balanceObject: 0,
      ));
    } catch (_) {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> clearCache() async {
    try {
      await Future.wait([
        spLocal.clearCache(),
        hiveLocalDataSource.clearCacheHive(),
      ]);
      return right(unit);
    } catch (_) {
      return left(CacheFailure());
    }
  }
}
