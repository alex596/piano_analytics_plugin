import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'piano_analytics_plugin_platform_interface.dart';

/// An implementation of [PianoAnalyticsPluginPlatform] that uses method channels.
class MethodChannelPianoAnalyticsPlugin extends PianoAnalyticsPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('piano_analytics_plugin');

  /// Used to configure your app with piano analytics configuration.
  @override
  Future<void> setConfiguration({
    required String collectDomain,
    required int site,
    String? privacyDefaultMode,
  }) async {
    await methodChannel.invokeMethod<void>('setConfiguration', {
      'collectDomain': collectDomain,
      'site': site,
      'privacyDefaultMode': privacyDefaultMode,
    });
  }

  /// Used to send event with name and data for this event.
  @override
  Future<void> sendEvent({required String eventName, required Map<String, dynamic> data}) async {
    await methodChannel.invokeMethod<void>('sendEvent', {'eventName': eventName, 'data': data});
  }
}
