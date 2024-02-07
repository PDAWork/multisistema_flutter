import 'package:multisitema_flutter/features/user/home/data/model/meter_body_dto.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/meter_body_entity.dart';

extension MeterBodyMapper on MeterBodyEntity {
  MeterBodyDto toDto() {
    return MeterBodyDto(
      idObject: idObject,
      date: date,
    );
  }
}
