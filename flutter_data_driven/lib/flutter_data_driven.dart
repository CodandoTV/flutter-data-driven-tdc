library flutter_data_drive_tdc;

import 'debug/interceptor/debug_crash_interceptor.dart';
import 'debug/interceptor/debug_error_interceptor.dart';
import 'debug/interceptor/debug_log_interceptor.dart';
import 'debug/interceptor/debug_network_interceptor.dart';
import 'domain/interceptor/engineering/crash_interceptor.dart';
import 'domain/interceptor/engineering/error_interceptor.dart';
import 'domain/interceptor/engineering/log_interceptor.dart';
import 'domain/interceptor/engineering/network_interceptor.dart';
import 'domain/interceptor/interceptor.dart';
import 'domain/interceptor/marketing/marketing_interceptor.dart';
import 'domain/interceptor/product/product_interceptor.dart';
import 'domain/interceptor/revenue/revenue_interceptor.dart';
import 'domain/model/engineering/crash_event.dart';
import 'domain/model/engineering/error_event.dart';
import 'domain/model/engineering/log_event.dart';
import 'domain/model/engineering/network_event.dart';
import 'domain/model/event.dart';
import 'domain/model/marketing/marketing_event.dart';
import 'domain/model/product/experience_event.dart';
import 'domain/model/revenue/revenue_event.dart';

class DataDriven {
  late List<Interceptor> _interceptors;

  DataDriven.init({List<Interceptor>? interceptors, bool isDebug = false}) {
    _interceptors = List.from(interceptors ?? List.empty());

    if (isDebug) {
      _interceptors.addAll([
        DebugCrashInterceptor(),
        DebugErrorInterceptor(),
        DebugLogInterceptor(),
        DebugNetworkInterceptor()
      ]);
    }
  }

  void track(Event event) {
    _interceptors.where((interceptor) {
      if (event is ErrorEvent) {
        return interceptor is ErrorInterceptor;
      } else if (event is LogEvent) {
        return interceptor is LogInterceptor;
      } else if (event is CrashEvent) {
        return interceptor is CrashInterceptor;
      } else if (event is NetworkEvent) {
        return interceptor is NetworkInterceptor;
      } else if (event is MarketingEvent) {
        return interceptor is MarketingInterceptor;
      } else if (event is ProductEvent) {
        return interceptor is ProductInterceptor;
      } else if (event is PurchaseEvent) {
        return interceptor is RevenueInterceptor;
      } else {
        return false;
      }
    }).forEach((interceptor) => interceptor.track(event));
  }

  void addInterceptor(Interceptor interceptor) =>
      _interceptors.add(interceptor);

  void addInterceptors(List<Interceptor> interceptors) =>
      _interceptors.addAll(interceptors);

  List<Interceptor> getAllInterceptors() => List.from(_interceptors);
}
