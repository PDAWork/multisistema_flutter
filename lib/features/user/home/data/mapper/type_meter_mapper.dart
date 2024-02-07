import 'package:multisitema_flutter/features/user/home/data/model/type_meter_dto.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/type_meter_entity.dart';

extension MeterMapper on TypeMeterDto {
  TypeMeterEntity toEntity() {
    return TypeMeterEntity(
      id: id,
      name: name,
    );
  }
}
