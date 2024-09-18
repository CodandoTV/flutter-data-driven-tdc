import 'package:flutter_data_driven/domain/interceptor/engineering/log_interceptor.dart';
import 'package:flutter_data_driven/domain/model/engineering/log_event.dart';
import 'package:flutter_data_driven_app/di/service_locator.dart';
import 'package:flutter_data_driven_app/dummy/app_dynamics_dummy.dart';

class AppDynamicsInterceptor extends LogInterceptor {
  final AppDynamicsDummy appDynamics = ServiceLocator.instance.appDynamics;

  @override
  void track(LogEvent event) {
    appDynamics.reportMetric(event.identifier);
  }
}
