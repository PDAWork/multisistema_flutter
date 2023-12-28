import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/home/domain/repository/splash_screen_repository.dart';

class SplashScreenUseCase {
  final SplashScreenRepository _splashScreenRepository;

  SplashScreenUseCase(this._splashScreenRepository);

  Future<Either<Failure, Unit>> getData() async {
    return await _splashScreenRepository.getOject(testIsInternet: true);
  }

  String getFirstName() => _splashScreenRepository.getFirstName();
}
