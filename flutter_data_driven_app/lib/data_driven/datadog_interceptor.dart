import 'package:flutter_data_driven/domain/interceptor/engineering/error_interceptor.dart';
import 'package:flutter_data_driven/domain/model/engineering/error_event.dart';
import 'package:flutter_data_driven_app/di/service_locator.dart';
import 'package:flutter_data_driven_app/dummy/datadog_dummy.dart';

class DatadogInterceptor extends ErrorInterceptor {
  final DataDogDummy _dataDog = ServiceLocator.instance.dataDog;

  @override
  void track(ErrorEvent event) {
    _dataDog.error(event.message);
  }
}
