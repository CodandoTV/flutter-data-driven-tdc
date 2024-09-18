import '../event.dart';

abstract class NetworkEvent extends Event {
  final String url;
  final String method;

  NetworkEvent(
      {required super.identifier, required this.url, required this.method});
}

class NetworkRequestEvent extends NetworkEvent {
  NetworkRequestEvent(
      {required super.identifier, required super.url, required super.method});
}

class NetworkResponseEvent extends NetworkEvent {
  final int statusCode;

  NetworkResponseEvent(
      {required super.identifier,
      required super.url,
      required super.method,
      required this.statusCode});
}
