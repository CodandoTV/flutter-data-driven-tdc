import '../event.dart';

class MarketingEvent extends Event {
  final String campaing;
  final String medium;
  final String source;

  MarketingEvent(
      {required super.identifier,
      required this.campaing,
      required this.medium,
      required this.source});
}
