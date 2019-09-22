//
//  ColorExt.swift
//  
//
//  Created by Amir Saidi on 9/23/19.
//

import UIKit


public extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
