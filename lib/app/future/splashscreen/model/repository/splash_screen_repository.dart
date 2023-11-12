import 'package:dartz/dartz.dart';

import '../../../../../utils/fauler.dart';

abstract interface class SplashScreenRepository {
  Future<Either<Failure, void>> loadData();
}
