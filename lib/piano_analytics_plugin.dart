import 'piano_analytics_plugin_platform_interface.dart';

class PianoAnalyticsPlugin {
  Future<void> setConfiguration(
      {required String collectDomain, required int site, String? visitorID}) {
    return PianoAnalyticsPluginPlatform.instance
        .setConfiguration(collectDomain: collectDomain, site: site, visitorID: visitorID);
  }

  Future<void> sendEvent(
      {required String eventName, required Map<String, dynamic> data}) {
    return PianoAnalyticsPluginPlatform.instance
        .sendEvent(eventName: eventName, data: data);
  }
}
