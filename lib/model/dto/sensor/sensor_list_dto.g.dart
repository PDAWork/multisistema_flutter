// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_list_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SensorListDTOAdapter extends TypeAdapter<SensorListDTO> {
  @override
  final int typeId = 4;

  @override
  SensorListDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SensorListDTO(
      sensorList: (fields[0] as List).cast<SensorDTO>(),
    );
  }

  @override
  void write(BinaryWriter writer, SensorListDTO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.sensorList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SensorListDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
