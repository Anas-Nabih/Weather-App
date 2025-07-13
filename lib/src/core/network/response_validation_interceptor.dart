import 'package:dio/dio.dart';


/// Intercepts successful and failed responses to validate structure or handle known errors
class ResponseValidationInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Validate known success structures or manually accepted response patterns
    if (response.statusCode == 200 &&
        (response.data['ok'] == true ||
            response.data['success'] == true ||
            response.data['location'] != null)) {
      handler.next(response);
    } else {
      // Extract error info from failed response
      String message = response.data['error']?['message'] ?? 'Unknown error';
      int statusCode = response.data['error']?['code'] ?? 500;

      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: message,
          type: DioExceptionType.badResponse,
          error: {"message": message, "status": statusCode},
        ),
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final data =
        (err.response?.data is List)
            ? err.response?.data[0]
            : err.response?.data;
    final error = data['errors'] ?? data["error"];
    final message = data["error"]['message'];

    super.onError(
      DioException(
        requestOptions: err.requestOptions,
        error: error,
        type: err.type,
        message: message,
      ),
      handler,
    );
  }
}
