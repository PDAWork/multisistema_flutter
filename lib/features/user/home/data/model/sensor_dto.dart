import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multisitema_flutter/features/user/home/data/model/meter_dto.dart';

part 'sensor_dto.freezed.dart';
part 'sensor_dto.g.dart';

@freezed
class SensorDto with _$SensorDto {
  const factory SensorDto(
      {required String sn,
      required String name,
      required String model,
      required bool active,
      required String ssid,
      required String? hardwere,
      required String? firmwawe,
      required int batery,
      required String localip,
      required int checkHours,
      required String? checkPeriodDipslay,
      required DateTime lastConnection,
      required String? lastConnectionWarning,
      required int? licChennels,
      required int requests,
      required String rssi,
      required double log,
      required int scan,
      required int vol,
      required int send,
      required DateTime? readoutDate,
      required DateTime? requestDate,
      required bool capState,
      required bool powerSupply,
      required bool emptyInputs,
      required String nbiot,
      @JsonKey(name: "meters") 
      required List<MeterDto> meterList}) = _SensorDto;

  factory SensorDto.fromJson(Map<String, dynamic> json) =>
      _$SensorDtoFromJson(json);
}
