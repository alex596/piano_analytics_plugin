/// Default privacy mode for configuration
///
/// Show details to [https://developers.atinternet-solutions.com/piano-analytics/data-collection/how-to-send-events/privacy#default-privacy-modes]
///
enum PrivacyDefaultMode {
  optin,
  exempt,
  noStorage,
  noConsent,
  optout,
}

enum OfflineEncryptionMode {
  none,
  ifCompatible,
  force,
}

enum OfflineStorageMode {
  always,
  required,
  never,
}

enum VisitorStorageMode {
  fixed,
  relative,
}

enum VisitorIdTypeMode {
  uuid,
  idfa,
  idfv,
  androidId,
  advertisingId,
  googleAdvertisingId,
  huaweuOpenAdvertisingId,
}
