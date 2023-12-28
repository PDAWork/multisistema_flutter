import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:multisitema_flutter/app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/features/auth/data/mapper/token_mapper.dart';
import 'package:multisitema_flutter/app/features/auth/domain/entity/token_entity.dart';
import 'package:multisitema_flutter/app/features/auth/domain/repository/token_repository.dart';

class TokenRepositoryImpl implements TokenRepository {
  TokenRepositoryImpl(this._authLocalDataSource, this._authRemoteDataSource);

  final AuthLocalDataSource _authLocalDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  String getAccessToken() => _authLocalDataSource.getAccessToken();

  @override
  String getRefreshToken() => _authLocalDataSource.getRefreshToken();

  @override
  Future<Either<Failure, TokenEntity>> refresh(String token) async {
    try {
      final tokenDto = await _authRemoteDataSource.refresh(token);
      await _authLocalDataSource.updateToken(tokenDto);
      return Right(tokenDto.toEntity());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
