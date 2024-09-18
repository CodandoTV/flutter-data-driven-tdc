import 'package:flutter_data_driven/domain/interceptor/engineering/crash_interceptor.dart';
import 'package:flutter_data_driven/domain/interceptor/engineering/error_interceptor.dart';
import 'package:flutter_data_driven/domain/interceptor/engineering/log_interceptor.dart';
import 'package:flutter_data_driven/domain/interceptor/engineering/network_interceptor.dart';
import 'package:flutter_data_driven/domain/interceptor/interceptor.dart';
import 'package:flutter_data_driven/domain/model/engineering/crash_event.dart';
import 'package:flutter_data_driven/domain/model/engineering/error_event.dart';
import 'package:flutter_data_driven/domain/model/engineering/log_event.dart';
import 'package:flutter_data_driven/domain/model/engineering/network_event.dart';
import 'package:flutter_data_driven/flutter_data_driven.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockErrorInterceptor extends Mock implements ErrorInterceptor {}

class MockLogInterceptor extends Mock implements LogInterceptor {}

class MockNetworkInterceptor extends Mock implements NetworkInterceptor {}

class MockCrashInterceptor extends Mock implements CrashInterceptor {}

class MockDefaultInterceptor extends Mock implements Interceptor {}

void main() {
  group('Data Driven interceptor tests', () {
    MockErrorInterceptor mockErrorInterceptor = MockErrorInterceptor();
    MockDefaultInterceptor mockDefaultInterceptor = MockDefaultInterceptor();
    late DataDriven dataDriven;
    late DataDriven dataDrivenDebug;

    setUp(() {
      dataDriven = DataDriven.init(interceptors: [mockDefaultInterceptor]);
      dataDrivenDebug = DataDriven.init(isDebug: true);
    });

    test('add a interceptor successfuly', () {
      dataDriven.addInterceptor(mockErrorInterceptor);
      expect(
          dataDriven.getAllInterceptors().contains(mockErrorInterceptor), true);
    });

    test('verify if default interceptor was added', () {
      expect(dataDriven.getAllInterceptors().contains(mockDefaultInterceptor),
          true);
    });

    test('verify if interceptors debug interceptors was added', () {
      expect(dataDrivenDebug.getAllInterceptors().isNotEmpty, true);
    });
  });

  group('Data Driven event tests', () {
    MockErrorInterceptor mockErrorInterceptor = MockErrorInterceptor();
    MockLogInterceptor mockLogInterceptor = MockLogInterceptor();
    MockNetworkInterceptor mockNetworkInterceptor = MockNetworkInterceptor();
    MockCrashInterceptor mockCrashInterceptor = MockCrashInterceptor();
    ErrorEvent mockErrorEvent = ErrorEvent(
        identifier: 'mockErrorEvent',
        exception: Exception(),
        message: '',
        stacktrace: '');

    LogEvent mockLogEvent = LogEvent(
        identifier: 'mockLogEvent', logType: LogType.warning, message: '');

    NetworkRequestEvent mockNetworkRequestEvent = NetworkRequestEvent(
        identifier: 'mockRequestEvent', url: 'google.com', method: 'GET');

    CrashEvent mockCrashEvent = CrashEvent(
        identifier: 'mockCrashEvent',
        exception: Exception(),
        title: '',
        stacktrace: '');
    late DataDriven dataDriven;

    setUp(() {
      dataDriven = DataDriven.init(interceptors: [
        mockErrorInterceptor,
        mockLogInterceptor,
        mockNetworkInterceptor,
        mockCrashInterceptor
      ]);
    });

    test('verify if error event was tracked', () {
      dataDriven.track(mockErrorEvent);
      verify(() => mockErrorInterceptor.track(mockErrorEvent)).called(1);
    });

    test('verify if log event was tracked', () {
      dataDriven.track(mockLogEvent);
      verify(() => mockLogInterceptor.track(mockLogEvent)).called(1);
    });

    test('verify if network event was tracked', () {
      dataDriven.track(mockNetworkRequestEvent);
      verify(() => mockNetworkInterceptor.track(mockNetworkRequestEvent))
          .called(1);
    });

    test('verify if crash event was tracked', () {
      dataDriven.track(mockCrashEvent);
      verify(() => mockCrashInterceptor.track(mockCrashEvent)).called(1);
    });
  });
}
