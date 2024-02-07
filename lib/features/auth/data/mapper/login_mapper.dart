import 'package:multisitema_flutter/features/auth/data/model/login_dto.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/login_entity.dart';

extension LoginMapper on LoginEntity {
  LoginDto toDto() {
    return LoginDto(login: login, password: password);
  }
}
