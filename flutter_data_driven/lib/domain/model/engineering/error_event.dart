import '../event.dart';

class ErrorEvent extends Event {
  final Exception exception;
  final String message;
  final String stacktrace;

  ErrorEvent(
      {required super.identifier,
      required this.exception,
      required this.message,
      required this.stacktrace});
}
