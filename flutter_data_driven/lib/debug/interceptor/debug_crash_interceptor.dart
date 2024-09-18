import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../domain/interceptor/engineering/crash_interceptor.dart';
import '../../domain/model/engineering/crash_event.dart';

class DebugCrashInterceptor implements CrashInterceptor {
  @override
  void track(CrashEvent event) {
    debugPrint('[Data Driven] track: ${inspect(event)}');
  }
}
