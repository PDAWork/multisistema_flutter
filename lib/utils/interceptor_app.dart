import 'dart:async';

import 'package:dio/dio.dart';
import 'package:multisitema_flutter/app/data/dto/body_response.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/utils/api_entrypoints.dart';

class InterceptorApp extends QueuedInterceptor {
  // final AuthRemoteDataSourceImpl _authRemoteDataSourceImpl;
  final AuthLocalDataSourceImpl _authLocalDataSourceImpl;
  String _email = '';
  String _password = '';

  InterceptorApp({required AuthLocalDataSourceImpl authLocalDataSourceImpl})
      : _authLocalDataSourceImpl = authLocalDataSourceImpl;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains(ApiEndpoints.login))
      for (var element in (options.data as FormData).fields) {
        switch (element.key) {
          case "password":
            {
              _password = element.value;
              break;
            }
          case "email":
            {
              _email = element.value;
              break;
            }
        }
      }
    super.onRequest(options, handler);
  }

  @override
  FutureOr<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final resultResposnse = BodyResponse.fromJson(response.data);
    if (resultResposnse.status.contains('bad')) {
      if (resultResposnse.errors.first.msg.contains('Неверный sid')) {
        final responseLogin = await Dio().post(
          '${ApiEndpoints.baseUrl}${ApiEndpoints.login}',
          data: FormData.fromMap(
            {
              'email': _email,
              'password': _password,
            },
          ),
        );
        if (responseLogin.data['status'] == 'ok')
          _authLocalDataSourceImpl.setSid(responseLogin.data['data']['sid']);
      }
    }
    super.onResponse(response, handler);
  }
}
