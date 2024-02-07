import 'package:freezed_annotation/freezed_annotation.dart';

part 'meter_body_dto.freezed.dart';
part 'meter_body_dto.g.dart';

@freezed
class MeterBodyDto with _$MeterBodyDto {
  const factory MeterBodyDto({
    required final int idObject,
    required final DateTime date,
  }) = _MeterBody;

  factory MeterBodyDto.fromJson(Map<String, dynamic> json) =>
      _$MeterBodyDtoFromJson(json);
}
