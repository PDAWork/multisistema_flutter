import 'package:dio/dio.dart';
import 'package:multisitema_flutter/common/api_entrypoints.dart';
import 'package:multisitema_flutter/model/dto/object/object_list_dto.dart';
import 'package:multisitema_flutter/model/dto/sensor/sensor_list_dto.dart';
import 'package:multisitema_flutter/model/dto/user/user_login_dto.dart';
import 'package:multisitema_flutter/model/dto/user/user_profile_dto.dart';

import '../common/fauler.dart';
import '../model/dto/body_response.dart';

abstract interface class RemoteDataSource {
  Future<UserLoginDTO> onLogin(String email, String password);

  Future<UserProfileDTO> userProfile(String sid);

  Future<ObjectListDTO> userObject(String sid);
  Future<SensorListDTO> objectMeters(String sid,int idObject);
}

class RemoteDataSourceIml implements RemoteDataSource {
  final Dio _dio;

  RemoteDataSourceIml(this._dio);

  @override
  Future<UserLoginDTO> onLogin(String email, String password) async {
    try {
      final result = await _dio.post(
        ApiEndpoints.login,
        data: FormData.fromMap(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      final response = BodyResponse<UserLoginDTO>.fromJson(result.data);

      if (response.status.contains('bad')) {
        throw AuthorizationExeption(message: 'Неправильный email или пароль');
      }

      return response.data;
    } on DioException {
      throw ServerExeption(message: 'Техническая ошибка');
    }
  }

  @override
  Future<UserProfileDTO> userProfile(String sid) async {
    try {
      final result = await _dio.get(
        '${ApiEndpoints.userProfile}?sid=$sid',
      );

      final response = BodyResponse<UserProfileDTO>.fromJson(result.data);

      if (response.status.contains('bad')) {
        final errorMessage = response.errors.first.msg;
        throw AuthorizationExeption(message: errorMessage);
      }

      return response.data;
    } on DioException {
      throw ServerExeption(message: 'Техническая ошибка');
    }
  }

  @override
  Future<ObjectListDTO> userObject(String sid) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.userObjects}?sid=$sid',
      );
      final bodyResponse = BodyResponse<ObjectListDTO>.fromJson(response.data);
      errorSid(bodyResponse);
      return bodyResponse.data;
    } on DioException {
      throw ServerExeption(message: "Технические работы");
    }
  }

  @override
  Future<SensorListDTO> objectMeters(
      String sid, int idObject) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.objectMeters}?sid=$sid&id=$idObject',
      );
      final bodyResponse = BodyResponse<SensorListDTO>.fromJson(response.data);

      errorSid(bodyResponse);
      return bodyResponse.data;
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
