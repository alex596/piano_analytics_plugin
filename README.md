# piano_analytics_plugin

A Flutter plugin for use Piano analytics SDK 

### Piano analytics Developers Documentation
Piano Analytics is the logical progression to our Analytics Suite 2, a solution that has been continuously developed for over 20 years and endorsed by tens of thousands of customers. With its user-centric, ethical-by-design and value driven data model, Piano Analytics synthesises product & marketing analytics, while solving the serious data quality issues facing the industry.

To read the developers documentation, see [Pinao Analytics](https://developers.atinternet-solutions.com/piano-analytics/).

*Note*: This plugin is still under development, and some APIs might not be available yet. [Feedback](https://github.com/flutter/flutter/issues) and [Pull Requests](https://github.com/flutter/plugins/pulls) are most welcome!

### Mobile Support 
 - [iOS](https://github.com/at-internet/piano-analytics-apple)
 - [Android](https://github.com/at-internet/piano-analytics-android)

### Usage
To use this plugin, add piano_analytics_plugin as a dependency in your pubspec.yaml file.

### Set configuration

This function is used for set piano analytics configuration.

```
    Future<void> setConfiguration({required String collectDomain, required int site});
```

### Send event
This function is used send event.

```
    Future<void> sendEvent({required String eventName, required Map<String, dynamic> data});
```

### Plugins

| Plugin      | Links |
|-------------| ------ |
| SDK iOS     | https://github.com/at-internet/piano-analytics-apple |
| SDK android | https://github.com/at-internet/piano-analytics-android |