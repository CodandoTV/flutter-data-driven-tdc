import 'package:flutter_data_driven/domain/interceptor/product/product_interceptor.dart';
import 'package:flutter_data_driven/domain/model/product/experience_event.dart';
import 'package:flutter_data_driven_app/di/service_locator.dart';
import 'package:flutter_data_driven_app/dummy/firebase_dummy.dart';

class FirebaseInterceptor extends ProductInterceptor {
  final FirebaseAnalyticsDummy _firebase = ServiceLocator.instance.firebase;

  @override
  void track(ProductEvent event) {
    _firebase.sendAnalyticsEvent(event.pageTitle);
  }
}
