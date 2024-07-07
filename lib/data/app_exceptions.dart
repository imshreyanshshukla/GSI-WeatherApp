// Define a base class for application-specific exceptions

class AppExceptions implements Exception {
  // Optional prefix to be prepended to the error message
  final String? _prefix;

  // The actual error message
  final String? _message;

  // Constructor allowing optional prefix and message
  AppExceptions([this._prefix, this._message]);

  // Override toString method to provide a formatted error message
  @override
  String toString() {
    return (_prefix != null ? '$_prefix: ' : '') + (_message ?? '');
  }
}

// Exception class for network connectivity issues
class InternetException extends AppExceptions {
  // Constructor allowing an optional custom message
  InternetException([String message = 'No Internet Connection'])
      : super('', message);
}

// Exception class for request timeouts
class RequestTimeOut extends AppExceptions {
  // Constructor allowing an optional custom message
  RequestTimeOut([String message = 'Request Timed Out']) : super('', message);
}

// Exception class for server-side errors
class ServerError extends AppExceptions {
  // Constructor allowing an optional custom message
  ServerError([String message = 'Server Error']) : super('', message);
}

// Exception class for invalid URLs encountered during API calls
class InvalidUrlException extends AppExceptions {
  // Constructor allowing an optional custom message
  InvalidUrlException([String message = 'Invalid URL']) : super('', message);
}

// Exception class for general data fetching errors
class FetchDataException extends AppExceptions {
  // Constructor allowing an optional custom message
  FetchDataException([String message = 'Error Fetching Data'])
      : super('', message);
}
