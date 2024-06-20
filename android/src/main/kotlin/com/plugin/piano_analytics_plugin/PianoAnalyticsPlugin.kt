package com.plugin.piano_analytics_plugin

import androidx.annotation.NonNull
import android.util.Log

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import io.piano.analytics.Event;
import io.piano.analytics.PianoAnalytics;
import io.piano.analytics.Configuration;
import io.piano.analytics.Configuration.VisitorIDType;
import io.piano.analytics.Configuration.VisitorStorageMode;
import io.piano.analytics.Configuration.OfflineStorageMode;
import io.piano.analytics.Configuration.EncryptionMode;

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

                    /// Return error if collectDomain is empty
                    if (collectDomain.isEmpty()) {
                        Log.e("PianoAnalyticsPlugin", "collectDomain is required")
                        result.error("500", "collectDomain is required", null)
                        return
                    }

                    val site: Int = arguments["site"] as Int
                    val path: String? = arguments["path"] as String?
                    val customUserAgent: String? = arguments["customUserAgent"] as String?
                    val crashDetection: Boolean = arguments["crashDetection"] as Boolean ?: PADefaultConfiguration.DEFAULT_CRASH_DETECTION
                    val sessionBackgroundDuration: Int = arguments["sessionBackgroundDuration"] as Int ?: PADefaultConfiguration.DEFAULT_SESSION_BACKGROUND_DURATION
                    val ignoreLimitedAdvertisingTracking: Boolean = arguments["ignoreLimitedAdvertisingTracking"] as Boolean ?: PADefaultConfiguration.DEFAULT_IGNORE_LIMITED_ADVERTISING_TRACKING
                    val sendEventWhenOptout: Boolean = arguments["sendEventWhenOptout"] as Boolean ?: PADefaultConfiguration.DEFAULT_SEND_WHEN_OPT_OUT

                    var privacyDefaultModeP: PrivacyDefaultModeP
                    try {
                        privacyDefaultModeP = PrivacyDefaultModeP.valueOf(arguments["privacyDefaultMode"] as String)
                    } catch (e: Exception) {
                        privacyDefaultModeP = PrivacyDefaultModeP.valueOf(PADefaultConfiguration.PRIVACY_DEFAULT_MODE)
                    }

                    var offlineEncryptionModeP: OfflineEncryptionModeP
                    try {
                        offlineEncryptionModeP = OfflineEncryptionModeP.valueOf(arguments["offlineEncryptionMode"] as String)
                    } catch (e: Exception) {
                        offlineEncryptionModeP = OfflineEncryptionModeP.valueOf(PADefaultConfiguration.DEFAULT_ENCRYPTION_MODE)
                    }

                    var offlineStorageModeP: OfflineStorageModeP
                    try {
                        offlineStorageModeP = OfflineStorageModeP.valueOf(arguments["offlineStorageMode"] as String)
                    } catch (e: Exception) {
                        offlineStorageModeP = OfflineStorageModeP.valueOf(PADefaultConfiguration.DEFAULT_OFFLINE_STORAGE_MODE)
                    }

                    val storageLifetimePrivacy: Int = arguments["storageLifetimePrivacy"] as Int ?: PADefaultConfiguration.DEFAULT_STORAGE_LIFETIME_PRIVACY
                    val storageLifetimeUser: Int = arguments["storageLifetimeUser"] as Int ?: PADefaultConfiguration.DEFAULT_STORAGE_LIFETIME_USER
                    val storageLifetimeVisitor: Int = arguments["storageLifetimeVisitor"] as Int ?: PADefaultConfiguration.DEFAULT_STORAGE_LIFETIME_VISITOR

                    var visitorStorageModeP: VisitorStorageModeP = VisitorStorageModeP.fixed
                    try {
                        visitorStorageModeP = VisitorStorageModeP.valueOf(arguments["visitorStorageMode"] as String)
                    } catch (e: Exception) {
                        visitorStorageModeP = VisitorStorageModeP.valueOf(PADefaultConfiguration.DEFAULT_VISITOR_STORAGE_MODE)
                    }

                    var visitorIdTypeModeP: VisitorIdTypeModeP = VisitorIdTypeModeP.uuid
                    try {
                        visitorIdTypeModeP = VisitorIdTypeModeP.valueOf(arguments["visitorIdTypeMode"] as String)
                    } catch (e: Exception) {
                        visitorIdTypeModeP = VisitorIdTypeModeP.valueOf(PADefaultConfiguration.DEFAULT_VISITOR_ID_TYPE_MODE)
                    }

                    val visitorId: String? = arguments["visitorId"] as String?

                    pa.setConfiguration(
                        Configuration.Builder()
                            .withCollectDomain(collectDomain)
                            .withSite(site)
                            .withPath(path)
                            .withCustomUserAgent(customUserAgent)
                            .enableCrashDetection(crashDetection)
                            .withSessionBackgroundDuration(sessionBackgroundDuration)
                            .enableIgnoreLimitedAdTracking(ignoreLimitedAdvertisingTracking)
                            .enableSendEventWhenOptOut(sendEventWhenOptout)
                            .withPrivacyDefaultMode(privacyDefaultModeP.sdkName)
                            .withEncryptionMode(offlineEncryptionModeP.sdkName)
                            .withOfflineStorageMode(offlineStorageModeP.sdkName)
                            .withStorageLifetimePrivacy(storageLifetimePrivacy)
                            .withStorageLifetimeUser(storageLifetimeUser)
                            .withStorageLifetimeVisitor(storageLifetimeVisitor)
                            .withVisitorStorageMode(visitorStorageModeP.sdkName)
                            .withVisitorIDType(visitorIdTypeModeP.sdkName)
                            .withVisitorID(visitorId)
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
            Log.e("PianoAnalyticsPlugin", e.toString())
            result.error("500", e.toString(), null)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
