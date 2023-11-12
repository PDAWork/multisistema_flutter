// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TariffDTOAdapter extends TypeAdapter<TariffDTO> {
  @override
  final int typeId = 6;

  @override
  TariffDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TariffDTO(
      id: fields[0] as int,
      name: fields[1] as String,
      balance: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TariffDTO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.balance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TariffDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
