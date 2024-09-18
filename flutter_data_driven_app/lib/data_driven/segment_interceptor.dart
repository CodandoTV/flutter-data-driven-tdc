import 'package:flutter_data_driven/domain/interceptor/product/product_interceptor.dart';
import 'package:flutter_data_driven/domain/model/product/experience_event.dart';
import 'package:flutter_data_driven_app/di/service_locator.dart';
import 'package:flutter_data_driven_app/dummy/segment_dummy.dart';

class SegmentInterceptor extends ProductInterceptor {
  final SegmentDummy _segment = ServiceLocator.instance.segment;

  @override
  void track(ProductEvent event) {
    _segment.screen(event.pageTitle);
  }
}
