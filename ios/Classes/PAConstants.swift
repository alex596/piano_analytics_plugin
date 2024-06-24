//
//  PAConstants.swift
//  piano_analytics_plugin
//
//  Created by Alexis LOUIS on 20/06/2024.
//

import PianoAnalytics

enum PrivacyDefaultModeP: String {
    case optin
    case exempt
    case noStorage = "noStorage"
    case noConsent = "noConsent"
    case optout
    
    func sdkType() -> String {
        switch self {
        case .optin:
            return  "optin"
            
        case .exempt:
            return  "exempt"
            
        case .noStorage:
            return "no-storage"
            
        case .noConsent:
            return "no-consent"
            
        case .optout:
            return "optout"
        }
    }
    
}

enum OfflineEncryptionModeP: String {
    ///  No encryption stored data
    case none
    /// encryption stored data enabled if device is compatible
    case ifCompatible
    /// /!\ encryption stored data enable AND if not data not stored
    case force
    
    func sdkType() -> EncryptionMode {
        switch self {
        case .none:
            return  EncryptionMode.None
            
        case .ifCompatible:
            return  EncryptionMode.IfCompatible
            
        case .force:
            return  EncryptionMode.Force
        }
    }
    
}

enum OfflineStorageModeP: String {
    /// Hits are stored in all cases and requires calling method to send
    case always
    /// Hits are sent if network is available, stored otherwise
    case required
    /// Hits are sent if network is available, lost otherwise
    case never
    
    func sdkType() -> OfflineStorageMode {
        switch self {
        case .always:
            return  OfflineStorageMode.Always
            
        case .required:
            return  OfflineStorageMode.Required
            
        case .never:
            return  OfflineStorageMode.Never
        }
    }
    
}

enum VisitorStorageModeP: String {
    /// FIXED : UUID will expires in all cases
    case fixed
    /// RELATIVE : UUID will expires in rare cases
    case relative
    
    func sdkType() -> VisitorStorageMode {
        switch self {
        case .fixed:
            return  VisitorStorageMode.Fixed
            
        case .relative:
            return  VisitorStorageMode.Relative
        }
    }
    
}

/// Careful when this type used : https://developer.android.com/training/articles/user-data-ids
enum VisitorIdTypeModeP: String {
    case uuid
    case idfa
    case idfv
    
    func sdkType() -> VisitorIdType {
        switch self {
        case .uuid:
            return  VisitorIdType.UUID
            
        case .idfa:
            return  VisitorIdType.IDFA
        case .idfv:
            return  VisitorIdType.IDFV
        }
    }
}
