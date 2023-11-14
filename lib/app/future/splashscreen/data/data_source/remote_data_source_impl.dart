import 'package:dio/dio.dart';
import 'package:multisitema_flutter/app/data/dto/body_response.dart';
import 'package:multisitema_flutter/app/future/splashscreen/data/data_source/remote_data_source.dart';
import 'package:multisitema_flutter/utils/api_entrypoints.dart';
import '../../../../../utils/fauler.dart';
import '../../../../data/dto/object/object_list_dto.dart';
import '../../../../data/dto/sensor/sensor_list_dto.dart';

class RemotedDataSourceImpl implements RemoteDataSource {
  RemotedDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future fetch(RequestOptions options) {
    try {
      return _dio.fetch(options);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<BodyResponse<SensorListDTO>> objectMetersDTO(
      String sid, String idObject) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.objectMeters}?sid=$sid&id=$idObject',
      );
      final data = BodyResponse<SensorListDTO>.fromJson(response.data);

      errorSid(data);
      return data;
    } on DioException {
      throw ServerExeption(message: "Технические работы");
    }
  }

  @override
  Future<BodyResponse<ObjectListDTO>> userObject(String sid) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.userObjects}?sid=$sid',
      );
      final data = BodyResponse<ObjectListDTO>.fromJson(response.data);
      errorSid(data);
      return data;
    } on DioException {
      throw ServerExeption(message: "Технические работы");
    }
  }

  void errorSid(BodyResponse data) {
    if (data.status.contains('bad')) {
      if (data.errors.first.msg.contains('Неверный sid'))
        throw AuthorizationExeption(message: 'Неверный sid');
    }
  }
}
