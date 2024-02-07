import 'package:dio/dio.dart';
import 'package:multisitema_flutter/app/di/locator_service.dart';
import 'package:multisitema_flutter/app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/features/auth/domain/usecase/token_use_case.dart';

class InterceptorApp extends QueuedInterceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      try {
        final token = service<TokenUseCase>().getRefreshToken();
        if (token != '') {
          await service<TokenUseCase>().updateToken(token);
          final response =
              await service<AuthRemoteDataSource>().fetch(err.requestOptions);
          return handler.resolve(response);
        }
      } catch (e) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = service<TokenUseCase>().getAccessToken();
    if (token.isEmpty) {
      super.onRequest(options, handler);
    } else {
      final headers = options.headers;
      headers['Authorization'] = 'Bearer $token';
      super.onRequest(options.copyWith(headers: headers), handler);
    }
  }
}
