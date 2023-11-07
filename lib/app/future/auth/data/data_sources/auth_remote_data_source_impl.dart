import 'package:dio/dio.dart';
import 'package:multisitema_flutter/app/data/dto/body_response.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_login_dto.dart';
import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';
import 'package:multisitema_flutter/utils/api_entrypoints.dart';
import 'package:multisitema_flutter/utils/fauler.dart';


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  final AuthLocalDataSourceImpl _authLocalDataSourceImpl;

  AuthRemoteDataSourceImpl(this._dio, this._authLocalDataSourceImpl);

  @override
  Future<void> userRegister() async {}

  @override
  Future<(Fauler, BodyResponse<UserLoginDTO>)> login(
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
        return (
          AuthorizationExeption(message: response.errors.first.msg),
          BodyResponse<UserLoginDTO>.empty(''),
        );
      }

      _authLocalDataSourceImpl.setSid(response.data.sid);

      return (Fauler(), response);
    } on DioException catch (e) {
      return (
        Fauler(message: e.message ?? ""),
        BodyResponse<UserLoginDTO>.empty(e.message ?? 'Ошибка')
      );
    }
  }

  @override
  Future<(Fauler, BodyResponse<UserProfileDTO>)> userProfile(String sid) async {
    try {
      final result = await _dio.get(
        '${ApiEndpoints.userProfile}?sid=$sid',
      );
      final response = BodyResponse<UserProfileDTO>.fromJson(result.data);
      if (response.status.contains('bad')) {
        final errorMessage = response.errors.first.msg;
        return (
          SidExeption(message: errorMessage),
          BodyResponse<UserProfileDTO>.empty(errorMessage),
        );
      }

      _authLocalDataSourceImpl.setUserProfile(response.data);

      return (Fauler(), response);
    } on DioException catch (e) {
      return (
        Fauler(message: e.message ?? ''),
        BodyResponse<UserProfileDTO>.empty(e.message ?? ''),
      );
    }
  }
}
