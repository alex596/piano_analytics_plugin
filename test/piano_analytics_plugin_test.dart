import 'package:flutter_test/flutter_test.dart';
import 'package:piano_analytics_plugin/piano_analytics_configuration_modes.dart';
import 'package:piano_analytics_plugin/piano_analytics_plugin.dart';
import 'package:piano_analytics_plugin/piano_analytics_plugin_method_channel.dart';
import 'package:piano_analytics_plugin/piano_analytics_plugin_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPianoAnalyticsPluginPlatform
    with MockPlatformInterfaceMixin
    implements PianoAnalyticsPluginPlatform {
  @override
  Future<void> setConfiguration({
    required String collectDomain,
    required int site,
    String? path,
    String? customUserAgent,
    bool crashDetection = true,
    int sessionBackgroundDuration = 30,
    bool ignoreLimitedAdvertisingTracking = false,
    bool sendEventWhenOptout = true,
    PrivacyDefaultMode privacyDefaultMode = PrivacyDefaultMode.optin,
    OfflineEncryptionMode offlineEncryptionMode = OfflineEncryptionMode.force,
    OfflineStorageMode offlineStorageMode = OfflineStorageMode.required,
    int storageLifetimePrivacy = 395,
    int storageLifetimeUser = 395,
    int storageLifetimeVisitor = 395,
    VisitorStorageMode visitorStorageMode = VisitorStorageMode.fixed,
    VisitorIdTypeMode visitorIdTypeMode = VisitorIdTypeMode.uuid,
    String? visitorId,
  }) async {}

  @override
  Future<void> sendEvent({
    required String eventName,
    required Map<String, dynamic>? data,
  }) async {}
}

void main() {
  final PianoAnalyticsPluginPlatform initialPlatform =
      PianoAnalyticsPluginPlatform.instance;

  test(
    '$MethodChannelPianoAnalyticsPlugin is the default instance',
    () {
      expect(
        initialPlatform,
        isInstanceOf<MethodChannelPianoAnalyticsPlugin>(),
      );
    },
  );

  test(
    'setConfiguration',
    () async {
      PianoAnalyticsPlugin pianoAnalyticsPlugin = PianoAnalyticsPlugin();
      MockPianoAnalyticsPluginPlatform fakePlatform =
          MockPianoAnalyticsPluginPlatform();
      PianoAnalyticsPluginPlatform.instance = fakePlatform;
      expect(
        pianoAnalyticsPlugin.setConfiguration(
          collectDomain: 'fake_collect_domain',
          site: 42,
        ),
        isA<void>(),
      );
    },
  );

  test(
    'setConfiguration with privacyDefaultMode',
    () async {
      PianoAnalyticsPlugin pianoAnalyticsPlugin = PianoAnalyticsPlugin();
      MockPianoAnalyticsPluginPlatform fakePlatform =
          MockPianoAnalyticsPluginPlatform();
      PianoAnalyticsPluginPlatform.instance = fakePlatform;
      expect(
        pianoAnalyticsPlugin.setConfiguration(
          collectDomain: 'fake_collect_domain',
          site: 42,
          privacyDefaultMode: PrivacyDefaultMode.optout,
        ),
        isA<void>(),
      );
    },
  );

  test(
    'setConfiguration with visitorId',
    () async {
      PianoAnalyticsPlugin pianoAnalyticsPlugin = PianoAnalyticsPlugin();
      MockPianoAnalyticsPluginPlatform fakePlatform =
          MockPianoAnalyticsPluginPlatform();
      PianoAnalyticsPluginPlatform.instance = fakePlatform;
      expect(
        pianoAnalyticsPlugin.setConfiguration(
          collectDomain: 'fake_collect_domain',
          visitorId: "fake_visitor_id",
          site: 42,
        ),
        isA<void>(),
      );
    },
  );

  test(
    'sendEvent',
    () async {
      PianoAnalyticsPlugin pianoAnalyticsPlugin = PianoAnalyticsPlugin();
      MockPianoAnalyticsPluginPlatform fakePlatform =
          MockPianoAnalyticsPluginPlatform();
      PianoAnalyticsPluginPlatform.instance = fakePlatform;

      expect(
        pianoAnalyticsPlugin.sendEvent(
          eventName: 'fake_event',
          data: {},
        ),
        isA<void>(),
      );
    },
  );
}
