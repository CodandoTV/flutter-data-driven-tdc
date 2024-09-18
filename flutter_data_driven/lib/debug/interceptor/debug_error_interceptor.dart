import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../domain/interceptor/engineering/error_interceptor.dart';
import '../../domain/model/engineering/error_event.dart';

class DebugErrorInterceptor extends ErrorInterceptor {
  @override
  void track(ErrorEvent event) {
    debugPrint('[Data Driven] track: ${inspect(event)}');
  }
}
