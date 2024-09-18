import '../event.dart';

abstract class ProductEvent extends Event {
  final String pageTitle;

  ProductEvent({required super.identifier, required this.pageTitle});
}

class PageViewEvent extends ProductEvent {
  PageViewEvent({required super.identifier, required super.pageTitle});
}

class InteractionEvent extends ProductEvent {
  final String interaction;

  InteractionEvent(
      {required super.identifier,
      required super.pageTitle,
      required this.interaction});
}
