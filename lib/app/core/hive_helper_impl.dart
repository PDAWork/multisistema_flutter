import 'package:hive_flutter/hive_flutter.dart';

import '../data/dto/object/object_dto.dart';
import '../data/dto/object/object_list_dto.dart';
import '../data/dto/object/tariff_dto.dart';
import '../data/dto/sensor/meters/meter_dto.dart';
import '../data/dto/sensor/meters/state_dto.dart';
import '../data/dto/sensor/meters/type_dto.dart';
import '../data/dto/sensor/sensor_dto.dart';
import '../data/dto/sensor/sensor_list_dto.dart';

import 'hive_helper.dart';

class HiveHelperImpl implements HiveHelper {
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MeterDTOAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ObjectDTOAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ObjectListDTOAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(SensorDTOAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(SensorListDTOAdapter());
    }

    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(StateDTOAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(TariffDTOAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(TypeDTOAdapter());
    }
  }

  @override
  Future<void> setObjectMeters(SensorListDTO sensorList) async {}

  @override
  Future<void> setUserObject(ObjectListDTO objectList) async {
    var boxObject = await Hive.openBox<ObjectListDTO>('objects');
    if (boxObject.values.isEmpty) {
      await boxObject.put('objects', objectList);
    } else {
      await boxObject.clear();
      await boxObject.put('objects', objectList);
    }
  }
}
