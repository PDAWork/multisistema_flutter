import 'package:dio/dio.dart';
import 'package:multisitema_flutter/app/core/error/exeption.dart';
import 'package:multisitema_flutter/app/features/auth/data/model/user_dto.dart';
import 'package:multisitema_flutter/app/core/network/api_entrypoints.dart';

import '../model/login_dto.dart';

abstract interface class AuthRemoteDataSource {
  // /api/auth/signIn
  Future<UserDto> signIn(LoginDto loginDto);

  // /api/auth/refresh
  Future<void> refresh(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> refresh(String token) async {
    try {
      final result = await _dio.post('/auth/refresh');
      return;
    } on DioException catch (e) {
      return;
    }
  }

  @override
  Future<UserDto> signIn(LoginDto loginDto) async {
    try {
      final result =
          await _dio.post(ApiEndpoints.signIn, data: loginDto.toJson());

      return UserDto.fromJson(result.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw UserException(errorMessage: e.response?.data["errorMessage"]);
      }
      throw Exception();
    }
  }
}
