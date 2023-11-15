import 'package:multisitema_flutter/model/dto/object/object_list_dto.dart';
import 'package:multisitema_flutter/model/dto/sensor/sensor_list_dto.dart';

abstract interface class HiveHelper {
  Future<void> init();
  Future<void> setUserObject(ObjectListDTO objectList);
  Future<void> setObjectMeters(SensorListDTO sensorList);

  Future<ObjectListDTO> getUserObject();
  Future<SensorListDTO> getUserObjectMeters();

  // Future<void> addUserObjectMeters(SensorListDTO sensorList);
}
