import 'package:multisitema_flutter/app/features/home/data/mapper/meter_mapper.dart';
import 'package:multisitema_flutter/app/features/home/data/model/sensor_dto.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/sensor_entity.dart';

extension SensorMapper on SensorDto {
  SensorEntity toEntity() {
    return SensorEntity(
      sn: sn,
      name: name,
      model: model,
      active: active,
      ssid: ssid,
      hardwere: hardwere ?? '',
      firmwawe: firmwawe ?? '',
      batery: batery,
      localip: localip,
      checkHours: checkHours,
      checkPeriodDipslay: checkPeriodDipslay ?? "",
      lastConnection: lastConnection,
      lastConnectionWarning: lastConnectionWarning ?? "",
      licChennels: licChennels ?? -1,
      requests: requests,
      rssi: rssi,
      log: log,
      scan: scan,
      vol: vol,
      send: send,
      readoutDate: readoutDate,
      requestDate: requestDate,
      capState: capState,
      powerSupply: powerSupply,
      emptyInputs: emptyInputs,
      nbiot: nbiot,
      meterList: meterList.map((e) => e.toEntity()).toList(),
    );
  }
}
