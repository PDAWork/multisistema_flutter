import 'package:dio/dio.dart';
import 'package:multisitema_flutter/app/di/locator_service.dart';
import 'package:multisitema_flutter/app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:multisitema_flutter/app/features/auth/domain/usecase/token_use_case.dart';

class InterceptorApp extends QueuedInterceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final token = sl<TokenUseCase>().getRefreshToken();
        if (token != '') {
          await sl<TokenUseCase>().updateToken(token);
          final response =
              await sl<AuthRemoteDataSource>().fetch(err.requestOptions);
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
    final token = sl<TokenUseCase>().getAccessToken();
    if (token.isEmpty) {
      super.onRequest(options, handler);
    } else {
      final headers = options.headers;
      headers['Authorization'] = 'Bearer $token';
      super.onRequest(options.copyWith(headers: headers), handler);
    }
  }
}
