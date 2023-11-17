import '../data/dto/object/object_list_dto.dart';
import '../data/dto/sensor/sensor_list_dto.dart';

abstract interface class HiveHelper {
  Future<void> init();
  Future<void> setUserObject(ObjectListDTO objectList);
  Future<void> setObjectMeters(SensorListDTO sensorList, String idObject,DateTime dateTime);

  Future<ObjectListDTO> getUserObject();
  Future<SensorListDTO> getUserObjectMeters(String idObject);
  Future<SensorListDTO> updateObjectMeters(
      SensorListDTO sensorList, String idObject, String date);

  Future<void> clearHive();

  // Future<void> addUserObjectMeters(SensorListDTO sensorList);
}
