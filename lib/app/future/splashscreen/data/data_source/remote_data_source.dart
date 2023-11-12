import 'package:dio/dio.dart';
import 'package:multisitema_flutter/app/data/dto/body_response.dart';

import '../../../../data/dto/object/object_list_dto.dart';
import '../../../../data/dto/sensor/sensor_list_dto.dart';

abstract interface class RemoteDataSource {
  Future<BodyResponse<ObjectListDTO>> userObject(String sid);
  Future<BodyResponse<SensorListDTO>> objectMetersDTO(
    String sid,
    String idObject,
  );
  Future<dynamic> fetch(RequestOptions options);
}
