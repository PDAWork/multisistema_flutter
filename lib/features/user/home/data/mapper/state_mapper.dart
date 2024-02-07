import 'package:multisitema_flutter/features/user/home/data/model/state_dto.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/state_entity.dart';

extension StateMapper on StateDto {
  StateEntity toEntity() {
    return StateEntity(
      id: id,
      name: name,
    );
  }
}
