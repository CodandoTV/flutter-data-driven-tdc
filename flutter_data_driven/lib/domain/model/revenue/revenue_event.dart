import 'dart:ffi';

import '../event.dart';

class PurchaseEvent extends Event {
  final Double value;
  final String currency;
  PurchaseEvent(
      {required super.identifier, required this.value, required this.currency});
}
