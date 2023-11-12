import 'package:hive_flutter/hive_flutter.dart';
import 'object_dto.dart';

part 'object_list_dto.g.dart';

@HiveType(typeId: 2)
class ObjectListDTO {
  @HiveField(0)
  final List<ObjectDTO> objects;

  ObjectListDTO({required this.objects});

  factory ObjectListDTO.fromJson(Map<String, dynamic> json) {
    return ObjectListDTO(
      objects: json['objects'] != null
          ? (json['objects'] as List).map((e) => ObjectDTO.fromJson(e)).toList()
          : [],
    );
  }
}
