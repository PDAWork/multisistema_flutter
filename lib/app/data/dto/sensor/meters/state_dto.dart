import 'package:hive_flutter/hive_flutter.dart';

part 'state_dto.g.dart';

@HiveType(typeId: 5)
class StateDTO {
  @HiveField(0)
  final String? nameError;
  @HiveField(1)
  final int? numberError;

  StateDTO({
    required this.nameError,
    required this.numberError,
  });

  factory StateDTO.fromJson(Map<String, dynamic> json) {
    return StateDTO(
      nameError: json['name'],
      numberError: json['number'],
    );
  }
}
