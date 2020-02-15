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
        case .ok_action: return UIAlertAction(title: "Ok", style: .default, handler: nil)
        case .dismiss_action: return UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        case .cancel_action: return UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        }
    }
}


/**
 It can be called from anywhere to show a message controller to the screen

    - important: Alert will be presented by current visible controller
    - returns:UIAlertController
    - parameters:
        - title: The title of the alert controller
        - message: The message the alert controller will contain
        - defaultAction: it is an uialertaction from AlertDefaultAction enum that is used mainly for dismissing the alert controller
        - actions: Array of UIAlertActions that will contain Alert Controller
        - dismissTime: This come in use for usin the Alert as self destruct Alert Message. It will be used if defaultActions is nil and actions is empty. Default value is 2 seconds
*/
public func Alert(title: String, message: String, defaultAction: AlertDefaultAction? = nil , actions: [UIAlertAction] = [], dismissTime: TimeInterval = 2) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

    if let defaultAct = defaultAction {
        alert.addAction(defaultAct.action)
    }

    for action: UIAlertAction in actions {
        alert.addAction(action)
    }

    if let current = UIApplication.topViewController() {

        if defaultAction == nil && actions.count == 0 {
            Timer.scheduledTimer(withTimeInterval: dismissTime, repeats: false) { (timer) in
                current.dismiss(animated: true, completion: nil)
            }
        }
        current.present(alert, animated: true, completion: nil)
    }
}


/**
 It can be called from anywhere to show a message controller to the screen

    - important:
    - returns:UIAlertController
    - parameters:
        - title: The title of the alert controller
        - message: The message the alert controller will contain
        - defaultAction: it is an uialertaction from AlertDefaultAction enum that is used mainly for dismissing the alert controller
        - actions: Array of UIAlertActions that will contain Alert Controller
        - controller: The UIViewController that will present the alert controller
        - dismissTime: This come in use for usin the Alert as self destruct Alert Message. It will be used if defaultActions is nil and actions is empty. Default value is 2 seconds
*/
public func Alert(title: String, message: String, defaultAction: AlertDefaultAction? = nil , actions: [UIAlertAction] = [], controller: UIViewController, dismissTime: TimeInterval = 2) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    if let defaultAct = defaultAction {
        alert.addAction(defaultAct.action)
    }
    
    for action: UIAlertAction in actions {
        alert.addAction(action)
    }
    
    if defaultAction == nil && actions.count == 0 {
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: dismissTime, repeats: false) { (timer) in
                controller.dismiss(animated: true, completion: nil)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    controller.present(alert, animated: true, completion: nil)
}



public extension UIViewController {
    
    /**
     Show Allert in the view from where it is colled
    
        - important: It will be available only inside UIViewController
        - returns:UIAlertController
        - parameters:
            - title: The title of the alert controller
            - message: The message the alert controller will contain
            - defaultAction: it is an uialertaction from AlertDefaultAction enum that is used mainly for dismissing the alert controller
            - actions: Array of UIAlertActions that will contain Alert Controller
            - dismissTime: This come in use for usin the Alert as self destruct Alert Message. It will be used if defaultActions is nil and actions is empty. Default value is 2 seconds
    */
    public func Alert(title: String, message: String, defaultAction: AlertDefaultAction? = nil , actions: [UIAlertAction] = [], dismissTime: TimeInterval = 2) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let defaultAct = defaultAction {
            alert.addAction(defaultAct.action)
        }
        
        for action: UIAlertAction in actions {
            alert.addAction(action)
        }
        
        if defaultAction == nil && actions.count == 0 {
            if #available(iOS 10.0, *) {
                Timer.scheduledTimer(withTimeInterval: dismissTime, repeats: false) { (timer) in
                    self.dismiss(animated: true, completion: nil)
                }
            } else {
            }
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /**
     Show message view of the bottom of the screen that will appear with animation and will be visible for about 1 second.
    
        - important: It is similar to Tost messages is android.
        - parameter message: A string that will contain the message
    */
    func showMessage(message: String) {
        
        let size = CGSize(width: self.view.frame.width - 10, height: self.view.frame.height - 40)
        
        let messageLabel = UILabel()
        messageLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.text = message
        
        let estimatedSize = messageLabel.sizeThatFits(size)
        let frame = CGRect(x: 16, y: self.view.frame.height, width: self.view.frame.width - 32, height: estimatedSize.height + 20)
        
        let messageBackground = UIView(frame: frame)
        self.view.addSubview(messageBackground)
        messageBackground.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            messageLabel.leadingAnchor.constraint(equalTo: messageBackground.leadingAnchor, constant: 5),
            messageLabel.trailingAnchor.constraint(equalTo: messageBackground.trailingAnchor, constant: -5),
            messageLabel.topAnchor.constraint(equalTo: messageBackground.topAnchor, constant: 5),
            messageLabel.bottomAnchor.constraint(equalTo: messageBackground.bottomAnchor, constant: -5)
            ].forEach { (constrint) in
                constrint.isActive = true
        }
        
        messageBackground.backgroundColor = UIColor(white: 0, alpha: 0.8)
        messageBackground.layer.cornerRadius = 10
        messageBackground.dropShadow(color: .black, opacity: 0.3, offSet: CGSize(width: -0.5, height: 0.5), radius: 10, scale: true)
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            messageBackground.transform = CGAffineTransform(translationX: 0, y: -(messageBackground.frame.size.height + 10 + (self.tabBarController?.tabBar.frame.height ?? 0)))
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseOut, animations: {
                messageBackground.transform = CGAffineTransform.identity
            }, completion: { (_) in
                messageBackground.removeFromSuperview()
            })
        }
        
    }

}
