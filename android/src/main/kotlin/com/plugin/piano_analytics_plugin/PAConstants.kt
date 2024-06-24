package com.plugin.piano_analytics_plugin

import io.piano.analytics.Configuration.VisitorIDType;
import io.piano.analytics.Configuration.VisitorStorageMode;
import io.piano.analytics.Configuration.OfflineStorageMode;
import io.piano.analytics.Configuration.EncryptionMode;

enum class PrivacyDefaultModeP(val sdkName: String) {
    optin("optin"),
    exempt("exempt"),
    noStorage("no-storage"),
    noConsent("no-consent"),
    optout("optout")
}

enum class OfflineEncryptionModeP(val sdkName: EncryptionMode) {
    ///  No encryption stored data
    none(EncryptionMode.NONE),
    /// encryption stored data enabled if device is compatible
    ifCompatible(EncryptionMode.IF_COMPATIBLE),
    /// /!\ encryption stored data enable AND if not data not stored
    force(EncryptionMode.FORCE)
}

enum class OfflineStorageModeP(val sdkName: OfflineStorageMode) {
    /// Hits are stored in all cases and requires calling method to send
    always(OfflineStorageMode.ALWAYS),
    /// Hits are sent if network is available, stored otherwise
    required(OfflineStorageMode.REQUIRED),
    /// Hits are sent if network is available, lost otherwise
    never(OfflineStorageMode.NEVER)
}

enum class VisitorStorageModeP(val sdkName: VisitorStorageMode) {
    /// FIXED : UUID will expires in all cases
    fixed(VisitorStorageMode.FIXED),
    /// RELATIVE : UUID will expires in rare cases
    relative(VisitorStorageMode.RELATIVE)
}

/// Careful when this type used : https://developer.android.com/training/articles/user-data-ids
enum class VisitorIdTypeModeP(val sdkName: VisitorIDType) {
    uuid(VisitorIDType.UUID),
    androidId(VisitorIDType.ANDROID_ID),
    advertisingId(VisitorIDType.ADVERTISING_ID),
    googleAdvertisingId(VisitorIDType.GOOGLE_ADVERTISING_ID),
    huaweuOpenAdvertisingId(VisitorIDType.HUAWEI_OPEN_ADVERTISING_ID)
}