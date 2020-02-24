import 'package:http/http.dart' as http;

class AppException implements Exception {
  AppException([this._message, this._prefix]);

  final _message;
  final _prefix;

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, 'Invalid requst: ');
}

class ServerException extends AppException {
  ServerException([String message]) : super(message, 'Server error: ');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([message]) : super(message, 'Unauthorized error: ');
}

AppException mapHttpError(http.Response response) {
  switch (response.statusCode) {
    case 400:
      return BadRequestException(response.body.toString());
    case 401:
    case 403:
      return UnauthorizedException(response.body.toString());
    case 500:
    default:
      return ServerException(response.body.toString());
  }
}
