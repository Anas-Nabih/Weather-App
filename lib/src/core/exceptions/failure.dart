class Failure implements Exception {
  final dynamic message;
  final int? code;
  Map<String, dynamic>? messageArray;
  Failure({this.message, this.messageArray, this.code});

  @override
  String toString() {
    Object message = this.message;

    return "Exception: $message";
  }
}

class ServerFailure extends Failure {
  ServerFailure({
    dynamic message,
    super.messageArray,
    int? statusCode,
  }) : super(
    message: message ?? "server_exception",
    code: statusCode ?? 500,
  );
}



class NetworkFailure extends Failure {
    NetworkFailure() : super(message: 'No internet connection');
}

class GeneralFailure extends Failure {
  GeneralFailure(
      {String? message, Map<String, dynamic>? messageArray, int? code})
      : super(
    message: message ?? "general_failure",
    code: code ?? 500,
  );
}