import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:multisitema_flutter/app/data/dto/body_response.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:multisitema_flutter/utils/api_entrypoints.dart';
import 'package:multisitema_flutter/utils/locator_service.dart';

class InterceptorApp extends QueuedInterceptor {
  // final AuthRemoteDataSourceImpl _authRemoteDataSourceImpl;
  final AuthLocalDataSource _authLocalDataSourceImpl;
  String _email = '';
  String _password = '';
  String _sid = '';
  final HttpClientAdapter httpClientAdapter = IOHttpClientAdapter(
    onHttpClientCreate: (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    },
  );

  InterceptorApp({required AuthLocalDataSource authLocalDataSourceImpl})
      : _authLocalDataSourceImpl = authLocalDataSourceImpl;
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    var responseLogin = null;

    while (responseLogin == null) {
      print(1);
      try {
        if (_email.isEmpty && _password.isEmpty) {
          final result = _authLocalDataSourceImpl.getLogin();
          _email = result.$1;
          _password = result.$2;
        }
        final dio = Dio()..httpClientAdapter = httpClientAdapter;
        responseLogin = await dio.post(
          '${ApiEndpoints.baseUrl}${ApiEndpoints.login}',
          data: FormData.fromMap(
            {
              'email': _email,
              'password': _password,
            },
          ),
        );

        if (responseLogin.data['status'] == 'ok') {
          _sid = responseLogin.data['data']['sid'];
          _authLocalDataSourceImpl.setSid(_sid);
        }

        final test = await sl<AuthRemoteDataSource>().fetch(err.requestOptions);
        return handler.resolve(test);
      } on DioException catch (e) {
        print(e.error);
      }
    }

    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains(ApiEndpoints.login)) {
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
    } else {
      if (_sid != '') {
        String path = options.path.replaceAll(RegExp('sid=[^&]+'), 'sid=$_sid');
        super.onRequest(options.copyWith(path: path), handler);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final resultResposnse = BodyResponse.fromJson(response.data);
    if (resultResposnse.status.contains('bad')) {
      if (resultResposnse.errors.first.msg.contains('Неверный sid')) {
        var responseLogin = null;

        while (responseLogin == null) {
          print(1);
          try {
            if (_email.isEmpty && _password.isEmpty) {
              final result = _authLocalDataSourceImpl.getLogin();
              _email = result.$1;
              _password = result.$2;
            }
            final dio = Dio()..httpClientAdapter = httpClientAdapter;
            responseLogin = await dio.post(
              '${ApiEndpoints.baseUrl}${ApiEndpoints.login}',
              data: FormData.fromMap(
                {
                  'email': _email,
                  'password': _password,
                },
              ),
            );

            if (responseLogin.data['status'] == 'ok') {
              _sid = responseLogin.data['data']['sid'];
              _authLocalDataSourceImpl.setSid(_sid);
            }

            final test =
                await sl<AuthRemoteDataSource>().fetch(response.requestOptions);
            return handler.resolve(test);
          } on DioException catch (e) {
            print(e.error);
          }
        }
      }
    }
    super.onResponse(response, handler);
  }
}
