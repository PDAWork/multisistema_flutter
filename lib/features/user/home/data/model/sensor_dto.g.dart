// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SensorDtoImpl _$$SensorDtoImplFromJson(Map<String, dynamic> json) =>
    _$SensorDtoImpl(
      sn: json['sn'] as String,
      name: json['name'] as String,
      model: json['model'] as String,
      active: json['active'] as bool,
      ssid: json['ssid'] as String,
      hardwere: json['hardwere'] as String?,
      firmwawe: json['firmwawe'] as String?,
      batery: json['batery'] as int,
      localip: json['localip'] as String,
      checkHours: json['checkHours'] as int,
      checkPeriodDipslay: json['checkPeriodDipslay'] as String?,
      lastConnection: DateTime.parse(json['lastConnection'] as String),
      lastConnectionWarning: json['lastConnectionWarning'] as String?,
      licChennels: json['licChennels'] as int?,
      requests: json['requests'] as int,
      rssi: json['rssi'] as String,
      log: (json['log'] as num).toDouble(),
      scan: json['scan'] as int,
      vol: json['vol'] as int,
      send: json['send'] as int,
      readoutDate: json['readoutDate'] == null
          ? null
          : DateTime.parse(json['readoutDate'] as String),
      requestDate: json['requestDate'] == null
          ? null
          : DateTime.parse(json['requestDate'] as String),
      capState: json['capState'] as bool,
      powerSupply: json['powerSupply'] as bool,
      emptyInputs: json['emptyInputs'] as bool,
      nbiot: json['nbiot'] as String,
      meterList: (json['meters'] as List<dynamic>)
          .map((e) => MeterDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SensorDtoImplToJson(_$SensorDtoImpl instance) =>
    <String, dynamic>{
      'sn': instance.sn,
      'name': instance.name,
      'model': instance.model,
      'active': instance.active,
      'ssid': instance.ssid,
      'hardwere': instance.hardwere,
      'firmwawe': instance.firmwawe,
      'batery': instance.batery,
      'localip': instance.localip,
      'checkHours': instance.checkHours,
      'checkPeriodDipslay': instance.checkPeriodDipslay,
      'lastConnection': instance.lastConnection.toIso8601String(),
      'lastConnectionWarning': instance.lastConnectionWarning,
      'licChennels': instance.licChennels,
      'requests': instance.requests,
      'rssi': instance.rssi,
      'log': instance.log,
      'scan': instance.scan,
      'vol': instance.vol,
      'send': instance.send,
      'readoutDate': instance.readoutDate?.toIso8601String(),
      'requestDate': instance.requestDate?.toIso8601String(),
      'capState': instance.capState,
      'powerSupply': instance.powerSupply,
      'emptyInputs': instance.emptyInputs,
      'nbiot': instance.nbiot,
      'meters': instance.meterList,
    };
