// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StateDTOAdapter extends TypeAdapter<StateDTO> {
  @override
  final int typeId = 5;

  @override
  StateDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StateDTO(
      nameError: fields[0] as String?,
      numberError: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StateDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nameError)
      ..writeByte(1)
      ..write(obj.numberError);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
