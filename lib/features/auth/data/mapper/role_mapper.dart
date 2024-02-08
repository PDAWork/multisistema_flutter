import 'package:multisitema_flutter/features/auth/data/model/user_dto.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/role_entity.dart';

extension RoleMapper on RoleDto {
  RoleEntity toEntity() {
    return RoleEntity.values[index];
  }
}
