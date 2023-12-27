import 'package:dartz/dartz.dart';
import 'package:multisitema_flutter/app/features/auth/domain/entity/token_entity.dart';
import 'package:multisitema_flutter/app/features/auth/domain/repository/token_repository.dart';

class TokenUseCase {
  final TokenRepository _tokenRepository;

  TokenUseCase(this._tokenRepository);

  Future<void> updateToken(String token) async {
    await _tokenRepository.refresh(token);
  }

  String getRefreshToken() {
    return _tokenRepository.getRefreshToken();
  }

  String getAccessToken() {
    return _tokenRepository.getAccessToken();
  }
}
