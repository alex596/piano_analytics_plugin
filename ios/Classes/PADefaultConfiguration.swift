//
//  PADefaultConfiguration.swift
//  piano_analytics_plugin
//
//  Created by Alexis LOUIS on 20/06/2024.
//

import Foundation
import PianoAnalytics

struct PADefaultConfiguration {
    static let DEFAULT_STORAGE_LIFETIME_PRIVACY: Int = 395
    static let DEFAULT_STORAGE_LIFETIME_VISITOR: Int = 395
    static let DEFAULT_STORAGE_LIFETIME_USER: Int = 395
    static let DEFAULT_SESSION_BACKGROUND_DURATION: Int = 30
    
    static let DEFAULT_IGNORE_LIMITED_ADVERTISING_TRACKING: Bool = false
    static let DEFAULT_CRASH_DETECTION: Bool = true
    static let DEFAULT_SEND_WHEN_OPT_OUT: Bool = true
    
    static let DEFAULT_OFFLINE_STORAGE_MODE: OfflineStorageModeP = OfflineStorageModeP.required
    static let DEFAULT_VISITOR_STORAGE_MODE: VisitorStorageModeP = VisitorStorageModeP.fixed
    static let DEFAULT_VISITOR_ID_TYPE_MODE: VisitorIdTypeModeP = VisitorIdTypeModeP.uuid
    static let DEFAULT_ENCRYPTION_MODE: OfflineEncryptionModeP = OfflineEncryptionModeP.ifCompatible
    static let PRIVACY_DEFAULT_MODE: PrivacyDefaultModeP = PrivacyDefaultModeP.optin
}
