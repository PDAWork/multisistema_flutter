import 'package:multisitema_flutter/app/features/home/data/model/state_dto.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/state_entity.dart';

extension StateMapper on StateDto {
  StateEntity toEntity() {
    return StateEntity(
      id: id,
      name: name,
    );
  }
}
