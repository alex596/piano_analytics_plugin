package com.plugin.piano_analytics_plugin

object PADefaultConfiguration {
    const val DEFAULT_STORAGE_LIFETIME_PRIVACY: Int = 395
    const val DEFAULT_STORAGE_LIFETIME_VISITOR: Int = 395
    const val DEFAULT_STORAGE_LIFETIME_USER: Int = 395
    const val DEFAULT_SESSION_BACKGROUND_DURATION: Int = 30

    const val DEFAULT_IGNORE_LIMITED_ADVERTISING_TRACKING: Boolean = false
    const val DEFAULT_CRASH_DETECTION: Boolean = true
    const val DEFAULT_SEND_WHEN_OPT_OUT: Boolean = true

    const val DEFAULT_OFFLINE_STORAGE_MODE: String = "required"
    const val DEFAULT_VISITOR_STORAGE_MODE: String = "fixed"
    const val DEFAULT_VISITOR_ID_TYPE_MODE: String = "uuid"
    const val DEFAULT_ENCRYPTION_MODE: String = "ifCompatible"
    const val PRIVACY_DEFAULT_MODE: String = "optin"
}