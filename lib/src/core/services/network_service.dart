import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../exceptions/exceptions.dart';

/// A service class to encapsulate all network requests using Dio -you can replace with any another client-.
abstract class NetworkService {
  Future<Response> get({
    Map<String, dynamic>? queryParameters,
    required String path,
    Options? options,
  });

  Future<Response> put({dynamic data, required String path});

  Future<Response> delete({
    Map<String, dynamic>? queryParameters,
    required String path,
  });

  Future<Response> post({
    dynamic data,
    Options? options,
    required String path,
    Function(int count, int total)? onProgress,
  });
}

@Injectable(as: NetworkService)
class DioService extends NetworkService {
  final Dio _dio;

  DioService(Dio dio) : _dio = dio;

  @override
  Future<Response> delete({
    Map<String, dynamic>? queryParameters,
    required String path,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ServerException(error: e.message);
    }
  }

  @override
  Future<Response> get({
    Map<String, dynamic>? queryParameters,
    required String path,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw ServerException(error: e.message);
    }
  }

  @override
  Future<Response> post({
    dynamic data,
    Options? options,
    required String path,
    Function(int count, int total)? onProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        options: options,
        data: data,
        onSendProgress: onProgress,
      );
      return response;
    } on DioException catch (e) {
      throw ServerException(
        error: e.message,
        errors: e.error as Map<String, dynamic>?,
      );
    }
  }

  @override
  Future<Response> put({dynamic data, required String path}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } on DioException catch (e) {
      throw ServerException(error: e.message);
    }
  }

  @override
  List<Interceptor> get interceptors => _dio.interceptors;
}
