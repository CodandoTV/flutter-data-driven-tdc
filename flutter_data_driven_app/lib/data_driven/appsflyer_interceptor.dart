import 'package:flutter_data_driven/domain/interceptor/product/product_interceptor.dart';
import 'package:flutter_data_driven/domain/model/product/experience_event.dart';
import 'package:flutter_data_driven_app/di/service_locator.dart';
import 'package:flutter_data_driven_app/dummy/appsflyer_dummy.dart';

class AppsFlyerInterceptor extends ProductInterceptor {
  final AppsFlyerDummy _appsFlyer = ServiceLocator.instance.appsFlyer;

  @override
  void track(ProductEvent event) {
    _appsFlyer.logEvent(event.pageTitle);
  }
}
