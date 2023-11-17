// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeterDTOAdapter extends TypeAdapter<MeterDTO> {
  @override
  final int typeId = 0;

  @override
  MeterDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeterDTO(
      meterId: fields[0] as int,
      meterName: fields[1] as String,
      input: fields[2] as int,
      approveDt: fields[3] as dynamic,
      eircNum: fields[4] as String,
      sn: fields[5] as String,
      type: fields[6] as TypeDTO,
      state: fields[7] as StateDTO,
      unit: fields[8] as String,
      vals: (fields[9] as List).cast<String>(),
      activeText: fields[10] as String?,
      passiveText: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MeterDTO obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.meterId)
      ..writeByte(1)
      ..write(obj.meterName)
      ..writeByte(2)
      ..write(obj.input)
      ..writeByte(3)
      ..write(obj.approveDt)
      ..writeByte(4)
      ..write(obj.eircNum)
      ..writeByte(5)
      ..write(obj.sn)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.state)
      ..writeByte(8)
      ..write(obj.unit)
      ..writeByte(9)
      ..write(obj.vals)
      ..writeByte(10)
      ..write(obj.activeText)
      ..writeByte(11)
      ..write(obj.passiveText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeterDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
