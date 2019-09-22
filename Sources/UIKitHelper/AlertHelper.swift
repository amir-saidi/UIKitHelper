//
//  AlertHelper.swift
//  
//
//  Created by Amir Saidi on 9/23/19.
//

import Foundation
import UIKit

public enum AlertDefaultAction {
    case ok_action, dismiss_action, cancel_action
    
    var action: UIAlertAction {
        switch self {
        case .ok_action: UIAlertAction(title: "Ok", style: .default, handler: nil)
        case .dismiss_action: UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        case .cancel_action: UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        }
    }
}


//public func Alert(title: String, message: String, defaultAction: AlertDefaultAction? = nil , actions: [UIAlertAction] = [], dismissTime: TimeInterval = 2) {
//    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//    if let defaultAct = defaultAction {
//        alert.addAction(defaultAct.action)
//    }
//
//    for action: UIAlertAction in actions {
//        alert .addAction(action)
//    }
//
//    if let current = UIApplication.topViewController() {
//
//        // If no action was provided dismiss alert after 2 sec
//        if defaultAction == nil && actions.count == 0 {
//            Timer.scheduledTimer(withTimeInterval: dismissTime, repeats: false) { (timer) in
//                current.dismiss(animated: true, completion: nil)
//            }
//        }
//        current.present(alert, animated: true, completion: nil)
//    }
//}


public func Alert(title: String, message: String, defaultAction: AlertDefaultAction? = nil , actions: [UIAlertAction] = [], controller: UIViewController, dismissTime: TimeInterval = 2) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    if let defaultAct = defaultAction {
        alert.addAction(defaultAct.action)
    }
    
    for action: UIAlertAction in actions {
        alert .addAction(action)
    }
    
    if defaultAction == nil && actions.count == 0 {
        Timer.scheduledTimer(withTimeInterval: dismissTime, repeats: false) { (timer) in
            controller.dismiss(animated: true, completion: nil)
        }
    }
    controller.present(alert, animated: true, completion: nil)
}
