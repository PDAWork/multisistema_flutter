// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeDTOAdapter extends TypeAdapter<TypeDTO> {
  @override
  final int typeId = 7;

  @override
  TypeDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypeDTO(
      name: fields[0] as String,
      number: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TypeDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
