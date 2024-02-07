// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObjectDtoAdapter extends TypeAdapter<ObjectDto> {
  @override
  final int typeId = 0;

  @override
  ObjectDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ObjectDto(
      id: fields[1] as int,
      house: fields[2] as String,
      label: fields[4] as String,
      number: fields[3] as String,
      accountId: fields[5] as String,
      personalAccount: fields[6] as String,
      connectDate: fields[7] as DateTime,
      enable: fields[8] as bool,
      balanceObject: fields[9] as int,
      accesLevel: fields[10] as String,
      objectCompanyName: fields[11] as String,
      objectCompanyUrl: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ObjectDto obj) {
    writer
      ..writeByte(12)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.house)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.label)
      ..writeByte(5)
      ..write(obj.accountId)
      ..writeByte(6)
      ..write(obj.personalAccount)
      ..writeByte(7)
      ..write(obj.connectDate)
      ..writeByte(8)
      ..write(obj.enable)
      ..writeByte(9)
      ..write(obj.balanceObject)
      ..writeByte(10)
      ..write(obj.accesLevel)
      ..writeByte(11)
      ..write(obj.objectCompanyName)
      ..writeByte(12)
      ..write(obj.objectCompanyUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjectDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
