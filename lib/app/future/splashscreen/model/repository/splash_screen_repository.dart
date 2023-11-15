import 'package:dartz/dartz.dart';

import '../../../../../common/fauler.dart';

abstract interface class SplashScreenRepository {
  Future<Either<Failure, void>> loadData();
}
