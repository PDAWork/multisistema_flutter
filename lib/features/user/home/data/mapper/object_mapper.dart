import 'package:multisitema_flutter/features/user/home/data/model/object_dto.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/object_entity.dart';

extension ObjectMapper on ObjectDto {
  ObjectEntity toEntity() {
    return ObjectEntity(
      id: id,
      label: label,
      house: house,
      number: number,
    );
  }
}
