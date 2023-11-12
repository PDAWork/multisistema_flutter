import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/hive_helper.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/splashscreen/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/app/future/splashscreen/model/repository/splash_screen_repository.dart';
import 'package:multisitema_flutter/utils/fauler.dart';

class SplashScreenRepositoryImpl implements SplashScreenRepository {
  final HiveHelper hiveHelper;
  final RemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  SplashScreenRepositoryImpl({
    required this.hiveHelper,
    required this.remoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, void>> loadData() async {
    final sid = authLocalDataSource.getSid();
    try {
      final userObject = await remoteDataSource.userObject(sid);
      final objectMeters = await remoteDataSource.objectMetersDTO(
        sid,
        userObject.data.objects.first.id.toString(),
      );
      await Future.wait({
        hiveHelper.setObjectMeters(objectMeters.data),
        hiveHelper.setUserObject(userObject.data)
      });

      return right(() {});
    } on ServerExeption catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }
}
