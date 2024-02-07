import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_dto.freezed.dart';
part 'state_dto.g.dart';


@freezed
class StateDto with _$StateDto {
  const factory StateDto({required int id, required String name}) = _StateDto;

  factory StateDto.fromJson(Map<String, dynamic> json) =>
      _$StateDtoFromJson(json);
}
