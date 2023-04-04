import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:piano_analytics_plugin/piano_analytics_plugin_method_channel.dart';

void main() {
  MethodChannelPianoAnalyticsPlugin platform = MethodChannelPianoAnalyticsPlugin();
  const MethodChannel channel = MethodChannel('piano_analytics_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('setConfiguration', () async {
    expect(platform.setConfiguration(collectDomain: 'fake_domain', site: 42), isA<void>());
  });

  test('sendEvent', () async {
    expect(platform.sendEvent(eventName: 'event_fake', data: {}), isA<void>());
  });
}
