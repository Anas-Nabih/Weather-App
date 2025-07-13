import 'package:dio/dio.dart';
import 'package:weather_app/src/core/helper/env_reader.dart';

/// Interceptor to add common headers and set base URL before each request
class HeadersInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Set the base URL dynamically from .env
    options.baseUrl = EnvReader.baseUrl;

    options.headers.addAll({
      'Accept': 'application/json',
      'Content-type': 'application/json',
    });

    super.onRequest(options, handler);
  }
}
