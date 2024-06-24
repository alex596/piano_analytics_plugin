struct PADefaultConfiguration {
    let DEFAULT_STORAGE_LIFETIME_PRIVACY: Int = 395
    let DEFAULT_STORAGE_LIFETIME_VISITOR: Int = 395
    let DEFAULT_STORAGE_LIFETIME_USER: Int = 395
    let DEFAULT_SESSION_BACKGROUND_DURATION: Int = 30

    let DEFAULT_IGNORE_LIMITED_ADVERTISING_TRACKING: Boolean = false
    let DEFAULT_CRASH_DETECTION: Boolean = true
    let DEFAULT_SEND_WHEN_OPT_OUT: Boolean = true

    let DEFAULT_OFFLINE_STORAGE_MODE: String = "required"
    let DEFAULT_VISITOR_STORAGE_MODE: String = "fixed"
    let DEFAULT_VISITOR_ID_TYPE_MODE: String = "uuid"
    let DEFAULT_ENCRYPTION_MODE: String = "ifCompatible"
    let PRIVACY_DEFAULT_MODE: String = "optin"
}