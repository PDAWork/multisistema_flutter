import 'package:hive_flutter/hive_flutter.dart';

part 'type_dto.g.dart';

@HiveType(typeId: 7)
class TypeDTO {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int number;

  TypeDTO({
    required this.name,
    required this.number,
  });

  factory TypeDTO.fromJson(Map<String, dynamic> json) {
    return TypeDTO(
      name: json['name'],
      number: json['number'],
    );
  }
}
