// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SensorDTOAdapter extends TypeAdapter<SensorDTO> {
  @override
  final int typeId = 3;

  @override
  SensorDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SensorDTO(
      sn: fields[0] as String,
      name: fields[1] as String,
      model: fields[2] as String,
      active: fields[3] as bool,
      ssid: fields[4] as String,
      firmware: fields[5] as String,
      bat: fields[6] as int,
      localIp: fields[7] as String,
      checkHours: fields[8] as int,
      checkPeriodDisplay: fields[9] as String,
      lastConnection: fields[10] as DateTime,
      lastConnectionWarning: fields[11] as String?,
      licChannels: fields[12] as dynamic,
      requests: fields[13] as int,
      rssi: fields[14] as String,
      log: fields[15] as double?,
      scan: fields[16] as int,
      vol: fields[17] as int,
      send: fields[18] as int,
      readoutDt: fields[19] as DateTime,
      requestDt: fields[20] as DateTime,
      capState: fields[21] as bool,
      powerSupply: fields[22] as bool,
      emptyInputs: fields[23] as bool,
      nbiot: fields[24] as bool,
      metersList: (fields[25] as List).cast<MeterDTO>(),
    );
  }

  @override
  void write(BinaryWriter writer, SensorDTO obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.sn)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.active)
      ..writeByte(4)
      ..write(obj.ssid)
      ..writeByte(5)
      ..write(obj.firmware)
      ..writeByte(6)
      ..write(obj.bat)
      ..writeByte(7)
      ..write(obj.localIp)
      ..writeByte(8)
      ..write(obj.checkHours)
      ..writeByte(9)
      ..write(obj.checkPeriodDisplay)
      ..writeByte(10)
      ..write(obj.lastConnection)
      ..writeByte(11)
      ..write(obj.lastConnectionWarning)
      ..writeByte(12)
      ..write(obj.licChannels)
      ..writeByte(13)
      ..write(obj.requests)
      ..writeByte(14)
      ..write(obj.rssi)
      ..writeByte(15)
      ..write(obj.log)
      ..writeByte(16)
      ..write(obj.scan)
      ..writeByte(17)
      ..write(obj.vol)
      ..writeByte(18)
      ..write(obj.send)
      ..writeByte(19)
      ..write(obj.readoutDt)
      ..writeByte(20)
      ..write(obj.requestDt)
      ..writeByte(21)
      ..write(obj.capState)
      ..writeByte(22)
      ..write(obj.powerSupply)
      ..writeByte(23)
      ..write(obj.emptyInputs)
      ..writeByte(24)
      ..write(obj.nbiot)
      ..writeByte(25)
      ..write(obj.metersList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SensorDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
