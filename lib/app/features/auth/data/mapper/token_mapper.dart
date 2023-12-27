import 'package:multisitema_flutter/app/features/auth/data/model/token_dto.dart';
import 'package:multisitema_flutter/app/features/auth/domain/entity/token_entity.dart';

extension LoginMapper on TokenDto {
  TokenEntity toEntity() {
    return TokenEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
