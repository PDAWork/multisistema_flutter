import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';

abstract interface class TokenRepository {
  Future<Either<Failure, void>> refresh(String token);
  String getAccessToken();
  String getRefreshToken();
}
