// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeterDtoImpl _$$MeterDtoImplFromJson(Map<String, dynamic> json) =>
    _$MeterDtoImpl(
      id: json['id'] as int,
      meterName: json['meter']['meterName'] as String,
      snMeter: json['meter']['snMeter'] as String,
      eircNum: json['meter']['eircNum'] as String,
      infoText: json['meter']['infoText'] as String?,
      typeMeter:
          TypeMeterDto.fromJson(json['meter']['TypeMeter'] as Map<String, dynamic>),
      state: json['meter']['State'] == null
          ? null
          : StateDto.fromJson(json['meter']['State'] as Map<String, dynamic>),
      metersVals: (json['meter']['MetersVals'] as List<dynamic>)
          .map((e) => (e['value'] as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$MeterDtoImplToJson(_$MeterDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meterName': instance.meterName,
      'snMeter': instance.snMeter,
      'eircNum': instance.eircNum,
      'infoText': instance.infoText,
      'TypeMeter': instance.typeMeter,
      'State': instance.state,
      'MetersVals': instance.metersVals,
    };
