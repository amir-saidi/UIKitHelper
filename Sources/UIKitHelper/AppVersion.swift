//
//  AppVersion.swift
//  
//
//  Created by Amir Saidi on 9/22/19.
//

import Foundation


import Foundation


extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
