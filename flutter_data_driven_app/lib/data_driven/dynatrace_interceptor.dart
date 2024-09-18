import 'package:flutter_data_driven/domain/interceptor/product/product_interceptor.dart';
import 'package:flutter_data_driven/domain/model/product/experience_event.dart';
import 'package:flutter_data_driven_app/di/service_locator.dart';
import 'package:flutter_data_driven_app/dummy/dynatrace_dummy.dart';

class DynatraceInterceptor extends ProductInterceptor {
  final DynatraceDummy _dynatrace = ServiceLocator.instance.dynatrace;

  @override
  void track(ProductEvent event) {
    _dynatrace.enterAction(event.pageTitle);
  }
}
