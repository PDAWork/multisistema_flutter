import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_meter_dto.freezed.dart';
part 'type_meter_dto.g.dart';

@freezed
class TypeMeterDto with _$TypeMeterDto {
  const factory TypeMeterDto({required int id, required String name}) =
      _TypeMeterDtom;

  factory TypeMeterDto.fromJson(Map<String, dynamic> json) =>
      _$TypeMeterDtoFromJson(json);
}
