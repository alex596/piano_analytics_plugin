import 'package:piano_analytics_plugin/piano_analytics_configuration_modes.dart';

import 'piano_analytics_plugin_platform_interface.dart';

class PianoAnalyticsPlugin {
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
  }) {
    return PianoAnalyticsPluginPlatform.instance.setConfiguration(
      collectDomain: collectDomain,
      site: site,
      path: path,
      customUserAgent: customUserAgent,
      crashDetection: crashDetection,
      sessionBackgroundDuration: sessionBackgroundDuration,
      ignoreLimitedAdvertisingTracking: ignoreLimitedAdvertisingTracking,
      sendEventWhenOptout: sendEventWhenOptout,
      privacyDefaultMode: privacyDefaultMode,
      offlineEncryptionMode: offlineEncryptionMode,
      offlineStorageMode: offlineStorageMode,
      storageLifetimePrivacy: storageLifetimePrivacy,
      storageLifetimeUser: storageLifetimeUser,
      storageLifetimeVisitor: storageLifetimeVisitor,
      visitorStorageMode: visitorStorageMode,
      visitorIdTypeMode: visitorIdTypeMode,
      visitorId: visitorId,
    );
  }

  Future<void> sendEvent({
    required String eventName,
    required Map<String, dynamic> data,
  }) {
    return PianoAnalyticsPluginPlatform.instance.sendEvent(
      eventName: eventName,
      data: data,
    );
  }
}
