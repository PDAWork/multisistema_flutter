import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/auth/domain/entity/token_entity.dart';

abstract interface class TokenRepository {
  Future<Either<Failure, void>> refresh(String token);
  String getAccessToken();
  String getRefreshToken();
}
