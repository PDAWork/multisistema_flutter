// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_list_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObjectListDTOAdapter extends TypeAdapter<ObjectListDTO> {
  @override
  final int typeId = 2;

  @override
  ObjectListDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ObjectListDTO(
      objects: (fields[0] as List).cast<ObjectDTO>(),
    );
  }

  @override
  void write(BinaryWriter writer, ObjectListDTO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.objects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjectListDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
