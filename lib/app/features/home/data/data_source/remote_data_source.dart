import 'package:dio/dio.dart';
import 'package:multisitema_flutter/app/core/error/exeption.dart';
import 'package:multisitema_flutter/app/core/network/api_entrypoints.dart';
import 'package:multisitema_flutter/app/features/home/data/model/object_dto.dart';

abstract interface class RemoteDataSource {
  // api/object/objects
  Future<List<ObjectDto>> getObject();
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
}
