//
//  File.swift
//  
//
//  Created by Amir Saidi on 2/15/20.
//

import UIKit

public extension UIApplication {
        
    /**
     A UIWindow parameter that holds current key window.
        - important: Works for iOS 13 and earlier versions
    */
    var currentWindow: UIWindow? {
        let systemVersion = (UIDevice.current.systemVersion as NSString).integerValue
        
        if systemVersion < 13 {
            return UIApplication.shared.keyWindow
        }
        
        for window in UIApplication.shared.windows {
            if window.isKeyWindow {
                return window
            }
        }
        return UIWindow()
    }
    
    
    /**
     Return top visible view controller
        - important: It may return nil if can not find
        - returns: UIViewController or nil if can't find one
    
    More description
    */
    class func topViewController() -> UIViewController? {
        
        let topController = UIApplication.shared.currentWindow?.rootViewController
        
        if let navigationController = topController as? UINavigationController {
            if let visibleVC =  navigationController.visibleViewController {
                return visibleVC
            }
        }
        
        if let tabController = topController as? UITabBarController {
            if let tabNav = tabController.selectedViewController as? UINavigationController {
                if let visibleVC = tabNav.visibleViewController {
                    return visibleVC
                }
            }
            
            if let tabselectedVC = tabController.selectedViewController {
                return tabselectedVC
            }
            
        }
        
        if let viewController = topController {
            return viewController
        }
        return nil
    }
    
}

