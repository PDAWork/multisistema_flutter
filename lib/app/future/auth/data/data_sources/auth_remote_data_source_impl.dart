import 'package:dio/dio.dart';
import 'package:multisitema_flutter/app/data/dto/body_response.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_login_dto.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';
import 'package:multisitema_flutter/utils/api_entrypoints.dart';
import 'package:multisitema_flutter/utils/fauler.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<void> userRegister() async {}

  @override
  Future<BodyResponse<UserLoginDTO>> login(
    String login,
    String password,
  ) async {
    try {
      final result = await _dio.post(
        ApiEndpoints.login,
        data: FormData.fromMap(
          {
            'email': login,
            'password': password,
          },
        ),
      );
      final response = BodyResponse<UserLoginDTO>.fromJson(result.data);

      if (response.status.contains('bad')) {
        throw AuthorizationExeption(message: 'Неправильный email или пароль');
      }

      return response;
    } on DioException {
      throw ServerExeption(message: 'Техническая ошибка');
    }
  }

  @override
  Future<BodyResponse<UserProfileDTO>> userProfile(String sid) async {
    try {
      final result = await _dio.get(
        '${ApiEndpoints.userProfile}?sid=$sid',
      );

      final response = BodyResponse<UserProfileDTO>.fromJson(result.data);

      if (response.status.contains('bad')) {
        final errorMessage = response.errors.first.msg;
        throw AuthorizationExeption(message: errorMessage);
      }

      return response;
    } on DioException {
      throw ServerExeption(message: 'Техническая ошибка');
    }
  }

  Future fetch(RequestOptions options) {
    try {
      return _dio.fetch(options);
    } catch (_) {
      rethrow;
    }
  }
}
