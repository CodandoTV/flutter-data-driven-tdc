import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../domain/interceptor/engineering/network_interceptor.dart';
import '../../domain/model/engineering/network_event.dart';

class DebugNetworkInterceptor extends NetworkInterceptor {
  @override
  void track(NetworkEvent event) {
    debugPrint('[Data Driven] track: ${inspect(event)}');
  }
}
