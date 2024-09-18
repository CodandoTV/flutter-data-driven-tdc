import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../domain/interceptor/engineering/log_interceptor.dart';
import '../../domain/model/engineering/log_event.dart';

class DebugLogInterceptor extends LogInterceptor {
  @override
  void track(LogEvent event) {
    debugPrint('[Data Driven] track: ${inspect(event)}');
  }
}
