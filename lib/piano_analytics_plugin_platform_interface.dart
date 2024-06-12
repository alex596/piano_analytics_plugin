import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'piano_analytics_plugin_method_channel.dart';

abstract class PianoAnalyticsPluginPlatform extends PlatformInterface {
  /// Constructs a PianoAnalyticsPluginPlatform.
  PianoAnalyticsPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PianoAnalyticsPluginPlatform _instance = MethodChannelPianoAnalyticsPlugin();

  /// The default instance of [PianoAnalyticsPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPianoAnalyticsPlugin].
  static PianoAnalyticsPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PianoAnalyticsPluginPlatform] when
  /// they register themselves.
  static set instance(PianoAnalyticsPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Sets the [collectDomain] and [site], which specifies configuration
  /// in your app.
  Future<void> setConfiguration({
    required String collectDomain,
    required int site,
    String? privacyDefaultMode,
  }) {
    throw UnimplementedError('setConfiguration() has not been implemented.');
  }

  /// Sets the current [eventName], which specifies the current visual context
  /// in your app.
  ///
  /// This helps identify the areas in your app where users spend their time
  ///
  /// [data] it allows to add information about the tracks
  Future<void> sendEvent({required String eventName, required Map<String, dynamic> data}) {
    throw UnimplementedError('sendEvent() has not been implemented.');
  }
}
