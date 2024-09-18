import '../event.dart';

class CrashEvent extends Event {
  final Exception exception;
  final String title;
  final String stacktrace;

  CrashEvent(
      {required super.identifier,
      required this.exception,
      required this.title,
      required this.stacktrace});
}
