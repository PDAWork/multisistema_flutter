// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/object_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObjectHiveAdapter extends TypeAdapter<ObjectDto> {
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
      label: fields[3] as String,
      accountId: fields[4] as String,
      personalAccount: fields[5] as String,
      connectDate: fields[6] as DateTime,
      enable: fields[7] as bool,
      balanceObject: fields[8] as int,
      accesLevel: fields[9] as String,
      objectCompanyName: fields[10] as String,
      objectCompanyUrl: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ObjectDto obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.house)
      ..writeByte(3)
      ..write(obj.label)
      ..writeByte(4)
      ..write(obj.accountId)
      ..writeByte(5)
      ..write(obj.personalAccount)
      ..writeByte(6)
      ..write(obj.connectDate)
      ..writeByte(7)
      ..write(obj.enable)
      ..writeByte(8)
      ..write(obj.balanceObject)
      ..writeByte(9)
      ..write(obj.accesLevel)
      ..writeByte(10)
      ..write(obj.objectCompanyName)
      ..writeByte(11)
      ..write(obj.objectCompanyUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjectHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
