import 'package:dio/dio.dart';

class InterceptorApp extends QueuedInterceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }
}
