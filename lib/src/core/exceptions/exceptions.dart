/// Base custom exception that accepts any type of message
class CustomException implements Exception {
  final dynamic message;

  CustomException([this.message]);
}

/// General fallback exception for unknown errors
class GeneralException extends CustomException {
  @override
  dynamic get message => "something went wrong";
}

/// Exception specifically for server-related errors
class ServerException implements CustomException {
  late String _message;
  late Map<String, dynamic> _errors;
  int? statusCode;

  ServerException({
    String? error,
    Map<String, dynamic>? errors,
    this.statusCode,
  }) {
    _message = error ?? "something went wrong";
    _errors = errors ?? {};
  }

  @override
  String get message => _message;

  Map<String, dynamic> get errors => _errors;
}
