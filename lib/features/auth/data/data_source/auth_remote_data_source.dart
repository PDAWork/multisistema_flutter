import 'package:dio/dio.dart';
import 'package:multisitema_flutter/core/error/exeption.dart';
import 'package:multisitema_flutter/features/auth/data/model/token_dto.dart';
import 'package:multisitema_flutter/features/auth/data/model/user_dto.dart';
import 'package:multisitema_flutter/core/network/api_entrypoints.dart';

import '../model/login_dto.dart';

abstract interface class AuthRemoteDataSource {
  // /api/auth/signIn
  Future<UserDto> signIn(LoginDto loginDto);

  // /api/auth/refresh
  Future<TokenDto> refresh(String token);

  Future fetch(RequestOptions options);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<TokenDto> refresh(String token) async {
    try {
      final result = await _dio.post('/auth/refresh', data: {
        "token": token,
      });
      return TokenDto.fromJson(result.data);
    } on DioException catch (_) {
      throw Exception();
    }
  }

  @override
  Future<UserDto> signIn(LoginDto loginDto) async {
    try {
      final result =
          await _dio.post(ApiEndpoints.signIn, data: loginDto.toJson());

      return UserDto.fromJson(result.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown ||
          e.type == DioExceptionType.badResponse) {
        throw ServerException();
      }
      if (e.response?.statusCode == 400) {
        throw UserException(errorMessage: e.response?.data["errorMessage"]);
      }
      throw Exception();
    }
  }

  @override
  Future fetch(RequestOptions options) {
    try {
      return _dio.fetch(options);
    } catch (_) {
      rethrow;
    }
  }
}
