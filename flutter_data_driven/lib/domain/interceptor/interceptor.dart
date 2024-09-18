import '../model/event.dart';

abstract class Interceptor<T extends Event> {
  void track(T event);
}
