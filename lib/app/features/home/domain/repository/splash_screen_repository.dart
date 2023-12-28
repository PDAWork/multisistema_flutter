import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';

abstract interface class SplashScreenRepository {
  Future<Either<Failure, Unit>> getOject({
    bool testIsInternet = false,
  });

  String getFirstName();
}
