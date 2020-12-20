//
//  AppVersion.swift
//  
//
//  Created by Amir Saidi on 9/22/19.
//

import Foundation


public extension Bundle {
    
    /**
     This variable holds app version number
        - important: Version number String
    */
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    
    /**
     This variable holds app build number
        - important: Build number String
    */
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    var appName: String {
        return infoDictionary?["CFBundleDisplayName"] as! String
    }
    
}
