import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Token  GOES Here';//! token 
    options.headers['Accept'] = 'application/json';
    super.onRequest(options, handler);
  }

  const ApiInterceptor();
}
