import 'package:dio/dio.dart';
import 'package:multisitema_flutter/core/error/exeption.dart';
import 'package:multisitema_flutter/core/network/api_entrypoints.dart';
import 'package:multisitema_flutter/features/user/home/data/model/meter_body_dto.dart';
import 'package:multisitema_flutter/features/user/home/data/model/object_dto.dart';
import 'package:multisitema_flutter/features/user/home/data/model/sensor_dto.dart';

abstract interface class RemoteDataSource {
  // api/object/objects
  Future<List<ObjectDto>> getObject();

  // api/meter/meter
  // Body : {
  //    idObject
  //    data - default now Date
  // }
  Future<List<SensorDto>> getMeters(MeterBodyDto meterBody);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<ObjectDto>> getObject() async {
    try {
      final response = await _dio.get(ApiEndpoints.objects);
      return (response.data as List)
          .map((element) => ObjectDto.fromJson(element))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<SensorDto>> getMeters(MeterBodyDto meterBody) async {
    try {
      final response =
          await _dio.get(ApiEndpoints.meters, data: meterBody.toJson());
      return (response.data as List).map((e) => SensorDto.fromJson(e)).toList();
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
