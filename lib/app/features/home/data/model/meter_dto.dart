import 'package:freezed_annotation/freezed_annotation.dart';

import 'state_dto.dart';
import 'type_meter_dto.dart';

part 'meter_dto.freezed.dart';
part 'meter_dto.g.dart';

@freezed

class MeterDto with _$MeterDto {
  const factory MeterDto({
    required int id,
    required String meterName,
    required String snMeter,
    required String eircNum,
    required String? infoText,
    @JsonKey(name: "TypeMeter") required TypeMeterDto typeMeter,
    @JsonKey(name: "State") required StateDto? state,
    @JsonKey(name: "MetersVals") required List<double> metersVals,
  }) = _MeterDto;

  factory MeterDto.fromJson(Map<String, dynamic> json) =>
      _$MeterDtoFromJson(json);
}
