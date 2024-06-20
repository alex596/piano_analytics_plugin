import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:piano_analytics_plugin/piano_analytics_configuration_modes.dart';

import 'piano_analytics_plugin_platform_interface.dart';

/// An implementation of [PianoAnalyticsPluginPlatform] that uses method channels.
class MethodChannelPianoAnalyticsPlugin extends PianoAnalyticsPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('piano_analytics_plugin');

  /// Used to configure your app with piano analytics configuration.
  /// Documentation : [https://developers.atinternet-solutions.com/piano-analytics/data-collection/sdks/android-java]
  ///
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
  }) async {
    await methodChannel.invokeMethod<void>(
      'setConfiguration',
      {
        'collectDomain': collectDomain,
        'site': site,
        'path': path,
        'customUserAgent': customUserAgent,
        'crashDetection': crashDetection,
        'sessionBackgroundDuration': sessionBackgroundDuration,
        'ignoreLimitedAdvertisingTracking': ignoreLimitedAdvertisingTracking,
        'sendEventWhenOptout': sendEventWhenOptout,
        'privacyDefaultMode': privacyDefaultMode.name,
        'offlineEncryptionMode': offlineEncryptionMode.name,
        'offlineStorageMode': offlineStorageMode.name,
        'storageLifetimePrivacy': storageLifetimePrivacy,
        'storageLifetimeUser': storageLifetimeUser,
        'storageLifetimeVisitor': storageLifetimeVisitor,
        'visitorStorageMode': visitorStorageMode.name,
        'visitorIdTypeMode': visitorIdTypeMode.name,
        'visitorId': visitorId,
      },
    );
  }

  /// Used to send event with name and data for this event.
  @override
  Future<void> sendEvent({
    required String eventName,
    required Map<String, dynamic> data,
  }) async {
    await methodChannel.invokeMethod<void>(
      'sendEvent',
      {
        'eventName': eventName,
        'data': data,
      },
    );
  }
}
