// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObjectDTOAdapter extends TypeAdapter<ObjectDTO> {
  @override
  final int typeId = 1;

  @override
  ObjectDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ObjectDTO(
      id: fields[0] as int,
      number: fields[1] as String,
      label: fields[2] as String,
      house: fields[3] as String,
      personalAccount: fields[4] as String,
      enable: fields[5] as bool,
      tarrifsList: (fields[6] as List?)?.cast<TariffDTO>(),
      utc: fields[7] as int,
      longitude: fields[8] as double?,
      latitude: fields[9] as double?,
      objectCompanyName: fields[10] as String?,
      objectCompanyInn: fields[11] as String?,
      objectCompanyAccount: fields[12] as String?,
      objectCompanyUrl: fields[13] as String?,
      connectDT: fields[14] as String,
      accessLevel: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ObjectDTO obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.label)
      ..writeByte(3)
      ..write(obj.house)
      ..writeByte(4)
      ..write(obj.personalAccount)
      ..writeByte(5)
      ..write(obj.enable)
      ..writeByte(6)
      ..write(obj.tarrifsList)
      ..writeByte(7)
      ..write(obj.utc)
      ..writeByte(8)
      ..write(obj.longitude)
      ..writeByte(9)
      ..write(obj.latitude)
      ..writeByte(10)
      ..write(obj.objectCompanyName)
      ..writeByte(11)
      ..write(obj.objectCompanyInn)
      ..writeByte(12)
      ..write(obj.objectCompanyAccount)
      ..writeByte(13)
      ..write(obj.objectCompanyUrl)
      ..writeByte(14)
      ..write(obj.connectDT)
      ..writeByte(15)
      ..write(obj.accessLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjectDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
