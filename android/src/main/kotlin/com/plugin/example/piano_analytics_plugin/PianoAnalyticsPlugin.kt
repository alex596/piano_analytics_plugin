package com.plugin.example.piano_analytics_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import io.piano.analytics.Event;
import io.piano.analytics.PianoAnalytics;
import io.piano.analytics.Configuration;

object PAEvents {
    const val SET_CONFIGURATION = "setConfiguration"
    const val SEND_EVENT = "sendEvent"
}

/** PianoAnalyticsPlugin */
class PianoAnalyticsPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var pa: PianoAnalytics

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "piano_analytics_plugin")
        channel.setMethodCallHandler(this)
        pa = PianoAnalytics.getInstance(flutterPluginBinding.applicationContext)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        try {

            val arguments: HashMap<String, Any> = call.arguments as HashMap<String, Any>

            when (call.method) {
                PAEvents.SET_CONFIGURATION -> {
                    val collectDomain: String = arguments["collectDomain"] as String
                    val site: Int = arguments["site"] as Int
                    val privacyDefaultMode: String? = arguments["privacyDefaultMode"] as String?

                    if (collectDomain.isEmpty()) {
                        result.error("500", "collectDomain is required", null)
                        return
                    }

                    if(privacyDefaultMode != null) {
                        pa.setConfiguration(
                            Configuration.Builder()
                                .withCollectDomain(collectDomain)
                                .withSite(site)
                                .withPrivacyDefaultMode(privacyDefaultMode)
                                .build()
                        )
                        return
                    }

                    pa.setConfiguration(
                        Configuration.Builder()
                            .withCollectDomain(collectDomain)
                            .withSite(site)
                            .build()
                    )
                }

                PAEvents.SEND_EVENT -> {
                    val eventName: String = arguments["eventName"] as String

                    if (eventName.isEmpty()) {
                        result.error("500", "eventName is required", null)
                    } else {
                        val data: HashMap<String, Any?> = arguments["data"] as HashMap<String, Any?>
                        pa.sendEvent(Event(eventName, data))
                    }
                }

                else -> result.notImplemented()
            }
        } catch (e: Exception) {
            result.error("500", e.toString(), null)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
