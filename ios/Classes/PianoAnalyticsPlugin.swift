import Flutter
import UIKit
import PianoAnalytics

public class PianoAnalyticsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "piano_analytics_plugin", binaryMessenger: registrar.messenger())
        let instance = PianoAnalyticsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch (call.method) {
        case PAEvents.setConfiguration:
            
            guard   let args = call.arguments as? Dictionary<String, AnyObject>,
                    let collectDomain = args["collectDomain"] as? String,
                    let site = args["site"] as? Int
            else{
                result(FlutterError(code: "500", message: "Error setConfiguration :: collectDomain and site parameters is required", details: nil))
                return
            }
            
            let path: String? = args["path"] as? String? ?? nil
            let customUserAgent: String? = args["customUserAgent"] as? String? ?? nil
            
            let crashDetection: Bool = args["crashDetection"] as? Bool ?? PADefaultConfiguration.DEFAULT_CRASH_DETECTION
            
            let sessionBackgroundDuration: Int = args["sessionBackgroundDuration"] as? Int ?? PADefaultConfiguration.DEFAULT_SESSION_BACKGROUND_DURATION
            
            let ignoreLimitedAdvertisingTracking: Bool = args["ignoreLimitedAdvertisingTracking"] as? Bool ?? PADefaultConfiguration.DEFAULT_IGNORE_LIMITED_ADVERTISING_TRACKING
            
            let sendEventWhenOptout: Bool = args["sendEventWhenOptout"] as? Bool ?? PADefaultConfiguration.DEFAULT_SEND_WHEN_OPT_OUT
            
            let storageLifetimePrivacy: Int = args["storageLifetimePrivacy"] as? Int ?? PADefaultConfiguration.DEFAULT_STORAGE_LIFETIME_PRIVACY
            let storageLifetimeUser: Int = args["storageLifetimeUser"] as? Int ?? PADefaultConfiguration.DEFAULT_STORAGE_LIFETIME_USER
            let storageLifetimeVisitor: Int = args["storageLifetimeVisitor"] as? Int ?? PADefaultConfiguration.DEFAULT_STORAGE_LIFETIME_VISITOR
            
            let visitorId: String? = args["visitorId"] as? String? ?? nil
            
            var privacyDefaultModeP = PADefaultConfiguration.PRIVACY_DEFAULT_MODE
            if let privacyDefaultModePString: String = args["privacyDefaultMode"] as? String {
                privacyDefaultModeP = PrivacyDefaultModeP(rawValue: privacyDefaultModePString) ?? PADefaultConfiguration.PRIVACY_DEFAULT_MODE
            }
            
            var offlineEncryptionModeP = PADefaultConfiguration.DEFAULT_ENCRYPTION_MODE
            if let offlineEncryptionModePString: String = args["offlineEncryptionMode"] as? String {
                offlineEncryptionModeP = OfflineEncryptionModeP(rawValue: offlineEncryptionModePString) ?? PADefaultConfiguration.DEFAULT_ENCRYPTION_MODE
            }
            
            var offlineStorageModeP = PADefaultConfiguration.DEFAULT_OFFLINE_STORAGE_MODE
            if let offlineStorageModePString: String = args["offlineStorageMode"] as? String {
                offlineStorageModeP = OfflineStorageModeP(rawValue: offlineStorageModePString) ?? PADefaultConfiguration.DEFAULT_OFFLINE_STORAGE_MODE
            }
            
            var visitorStorageModeP = PADefaultConfiguration.DEFAULT_VISITOR_STORAGE_MODE
            if let visitorStorageModePString: String = args["visitorStorageMode"] as? String {
                visitorStorageModeP = VisitorStorageModeP(rawValue: visitorStorageModePString) ?? PADefaultConfiguration.DEFAULT_VISITOR_STORAGE_MODE
            }
            
            var visitorIdTypeModeP = PADefaultConfiguration.DEFAULT_VISITOR_ID_TYPE_MODE
            if let visitorIdTypeModePString: String = args["visitorIdTypeMode"] as? String {
                visitorIdTypeModeP = VisitorIdTypeModeP(rawValue: visitorIdTypeModePString) ?? PADefaultConfiguration.DEFAULT_VISITOR_ID_TYPE_MODE
            }
            
            var config : ConfigurationBuilder = ConfigurationBuilder().withCollectDomain(collectDomain)
                .withSite(site)
                .enableCrashDetection(crashDetection)
                .withSessionBackgroundDuration(sessionBackgroundDuration)
                .enableIgnoreLimitedAdTracking(ignoreLimitedAdvertisingTracking)
                .enableSendEventWhenOptout(sendEventWhenOptout)
                .withPrivacyDefaultMode(privacyDefaultModeP.sdkType())
                .withOfflineEncryptionMode(offlineEncryptionModeP.sdkType().rawValue)
                .withOfflineStorageMode(offlineStorageModeP.sdkType().rawValue)
                .withStorageLifetimePrivacy(storageLifetimePrivacy)
                .withStorageLifetimeUser(storageLifetimeUser)
                .withStorageLifetimeVisitor(storageLifetimeVisitor)
                .withVisitorStorageMode(visitorStorageModeP.sdkType().rawValue)
                .withVisitorIdType(visitorIdTypeModeP.sdkType().rawValue)
            
            if let pathValue = path{
                config = config.withPath(pathValue)
            }
            
            if let customUserAgentValue = customUserAgent {
                config = config.withCustomUserAgent(customUserAgentValue)
            }
            
            if let visitorIdValue = visitorId {
                config = config.withVisitorIdType(visitorIdValue)
            }
            
            pa.setConfiguration(
                config
                    .build()
            )
            
            break
        case PAEvents.sendEvent:
            guard   let args = call.arguments as? Dictionary<String, AnyObject>,
                    let eventName = args["eventName"] as? String
            else{
                result(FlutterError(code: "500", message: "Error sendEvent :: eventName is required", details: nil))
                return
            }
            
            
            if let data = args["data"] as? Dictionary<String, AnyObject> {
                pa.sendEvent(Event(eventName, data: data))
            } else {
                pa.sendEvent(Event(eventName, data: [:]))
            }
            
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
