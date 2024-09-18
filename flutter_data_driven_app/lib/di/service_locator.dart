import 'package:flutter_data_driven/flutter_data_driven.dart';
import 'package:flutter_data_driven_app/data_driven/app_dynamics_interceptor.dart';
import 'package:flutter_data_driven_app/data_driven/appsflyer_interceptor.dart';
import 'package:flutter_data_driven_app/data_driven/datadog_interceptor.dart';
import 'package:flutter_data_driven_app/data_driven/dynatrace_interceptor.dart';
import 'package:flutter_data_driven_app/data_driven/firebase_interceptor.dart';
import 'package:flutter_data_driven_app/data_driven/segment_interceptor.dart';
import 'package:flutter_data_driven_app/dummy/app_dynamics_dummy.dart';
import 'package:flutter_data_driven_app/dummy/appsflyer_dummy.dart';
import 'package:flutter_data_driven_app/dummy/datadog_dummy.dart';
import 'package:flutter_data_driven_app/dummy/dynatrace_dummy.dart';
import 'package:flutter_data_driven_app/dummy/firebase_dummy.dart';
import 'package:flutter_data_driven_app/dummy/segment_dummy.dart';

class ServiceLocator {
  static ServiceLocator? _instance;

  ServiceLocator._();

  static ServiceLocator get instance {
    return _instance ??= ServiceLocator._();
  }

  // Dummy Instances
  final FirebaseAnalyticsDummy firebase = FirebaseAnalyticsDummy();
  final SegmentDummy segment = SegmentDummy();
  final DynatraceDummy dynatrace = DynatraceDummy();
  final DataDogDummy dataDog = DataDogDummy();
  final AppsFlyerDummy appsFlyer = AppsFlyerDummy();
  final AppDynamicsDummy appDynamics = AppDynamicsDummy();

  // Data Driven instance
  final DataDriven dataDriven = DataDriven.init(interceptors: [
    AppDynamicsInterceptor(),
    AppsFlyerInterceptor(),
    DatadogInterceptor(),
    DynatraceInterceptor(),
    FirebaseInterceptor(),
    SegmentInterceptor()
  ], isDebug: true);
}
