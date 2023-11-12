import '../data/dto/object/object_list_dto.dart';
import '../data/dto/sensor/sensor_list_dto.dart';

abstract interface class HiveHelper {
  Future<void> init();
  Future<void> setUserObject(ObjectListDTO objectList);
  Future<void> setObjectMeters(SensorListDTO sensorList);
}
