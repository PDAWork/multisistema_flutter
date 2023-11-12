import 'package:hive_flutter/hive_flutter.dart';

import 'sensor_dto.dart';

part 'sensor_list_dto.g.dart';

@HiveType(typeId: 4)
class SensorListDTO {
  @HiveField(0)
  final List<SensorDTO> sensorList;

  SensorListDTO({required this.sensorList});

  factory SensorListDTO.fromJson(Map<String, dynamic> json) {
    return SensorListDTO(
      sensorList:
          (json['sensors'] as List).map((e) => SensorDTO.fromJson(e)).toList(),
    );
  }
}
