abstract class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class DefaultError extends AppException {
  DefaultError([String message = "Something went wrong"]) : super(message);
}
