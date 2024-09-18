import '../event.dart';

class LogEvent extends Event {
  final LogType logType;
  final String message;

  LogEvent(
      {required super.identifier,
      required this.logType,
      required this.message});
}

enum LogType { success, error, info, warning }
