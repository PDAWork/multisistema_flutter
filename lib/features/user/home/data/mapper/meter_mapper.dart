import 'package:multisitema_flutter/features/user/home/data/mapper/state_mapper.dart';
import 'package:multisitema_flutter/features/user/home/data/mapper/type_meter_mapper.dart';
import 'package:multisitema_flutter/features/user/home/data/model/meter_dto.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/meter_entity.dart';

extension MeterMapper on MeterDto {
  MeterEntity toEntity() {
    return MeterEntity(
        id: id,
        meterName: meterName,
        snMeter: snMeter,
        eircNum: eircNum,
        infoText: infoText ?? "",
        typeMeter: typeMeter.toEntity(),
        state: state?.toEntity(),
        metersVals: metersVals);
  }
}
