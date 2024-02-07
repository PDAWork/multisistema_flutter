// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeterBodyImpl _$$MeterBodyImplFromJson(Map<String, dynamic> json) =>
    _$MeterBodyImpl(
      idObject: json['idObject'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$MeterBodyImplToJson(_$MeterBodyImpl instance) =>
    <String, dynamic>{
      'idObject': instance.idObject,
      'date': instance.date.toIso8601String(),
    };
