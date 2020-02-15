//
//  UIKitConstraints.swift
//  
//
//  Created by Amir Saidi on 9/23/19.
//

import UIKit


// MARK: - Constraint based on given view

@available(iOS 9.0, *)
/**
 This extension holds chain functions that make easier to manipulate with constrints programatically
*/
public extension UIView {
    
    @discardableResult func applyConstraints() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    @discardableResult func fillSuperView(padding: CGFloat = 0) -> UIView {
        guard let superview = self.superview else { return self }
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding).isActive = true
        return self
    }
    
    @discardableResult func vFillSuperView(padding: CGFloat = 0) -> UIView {
        guard let superview = self.superview else { return self }
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding).isActive = true
        return self
    }
    
    @discardableResult func hFillSuperView(padding: CGFloat = 0) -> UIView {
        guard let superview = self.superview else { return self }
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding).isActive = true
        return self
    }
    
    @discardableResult func centerToContainer() -> UIView {
        guard let superview = self.superview else { return self }
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        return self
    }
    
    @discardableResult func centerToFillContainer(margin: CGFloat = 0) -> UIView {
        guard let superview = self.superview else { return self }
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        self.topAnchor.constraint(greaterThanOrEqualTo: superview.topAnchor, constant: margin).isActive = true
        self.bottomAnchor.constraint(lessThanOrEqualTo: superview.bottomAnchor, constant: -margin).isActive = true
        self.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: margin).isActive = true
        self.trailingAnchor.constraint(lessThanOrEqualTo: superview.trailingAnchor, constant: -margin).isActive = true
        return self
    }
    
    @discardableResult func vCenter(to view: UIView, const: CGFloat = 0) -> UIView {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return self
    }
    
    @discardableResult func hCenter(to view: UIView, const: CGFloat = 0) -> UIView {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return self
    }
    
    @discardableResult func leading(to view: UIView, const: CGFloat = 0, reverse: Bool = false) -> UIView {
        let anchor = reverse ? view.trailingAnchor : view.leadingAnchor
        self.leadingAnchor.constraint(equalTo: anchor, constant: const).isActive = true
        return self
    }
    
    @discardableResult func trailing(to view: UIView, const: CGFloat = 0, reverse: Bool = false) -> UIView {
        let anchor = reverse ? view.leadingAnchor : view.trailingAnchor
        self.trailingAnchor.constraint(equalTo: anchor, constant: const).isActive = true
        return self
    }
    
    @discardableResult func top(to view: UIView, const: CGFloat = 0, reverse: Bool = false) -> UIView {
        let anchor = reverse ? view.bottomAnchor : view.topAnchor
        self.topAnchor.constraint(equalTo: anchor, constant: const).isActive = true
        return self
    }
    
    @discardableResult func bottom(to view: UIView, const: CGFloat = 0, reverse: Bool = false) -> UIView {
        let anchor = reverse ? view.topAnchor : view.bottomAnchor
        self.bottomAnchor.constraint(equalTo: anchor, constant: const).isActive = true
        return self
    }
    
    @discardableResult func width(const: CGFloat) -> UIView {
        self.widthAnchor.constraint(equalToConstant: const).isActive = true
        return self
    }
    
    @discardableResult func height(const: CGFloat) -> UIView {
        self.heightAnchor.constraint(equalToConstant: const).isActive = true
        return self
    }
    
    @discardableResult func viewSize(const: CGFloat) -> UIView {
        self.widthAnchor.constraint(equalToConstant: const).isActive = true
        self.heightAnchor.constraint(equalToConstant: const).isActive = true
        return self
    }
    
    @discardableResult func lessTharOrEquealWidth(to constant: CGFloat) -> UIView {
        self.widthAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult func greaterTharOrEquealWidth(to constant: CGFloat) -> UIView {
        self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        return self
    }
    
    
    @discardableResult func lessTharOrEquealHeight(to constant: CGFloat) -> UIView {
        self.heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult func greaterTharOrEquealHeight(to constant: CGFloat) -> UIView {
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        return self
    }
}


// MARK: - Constraint based on given anchors
@available(iOS 9.0, *)
public extension UIView {
    
    @discardableResult func vCenter(to anchor: NSLayoutYAxisAnchor, const: CGFloat = 0) -> UIView {
        self.centerYAnchor.constraint(equalTo: anchor, constant: const).isActive = true
        return self
    }
    
    @discardableResult func hCenter(to anchor: NSLayoutXAxisAnchor, const: CGFloat = 0) -> UIView {
        self.centerXAnchor.constraint(equalTo: anchor).isActive = true
        return self
    }
    
    @discardableResult func leading(to anchor: NSLayoutXAxisAnchor, const: CGFloat = 0) -> UIView {
        self.leadingAnchor.constraint(equalTo: anchor, constant: const).isActive = true
        return self
    }
    
    @discardableResult func trailing(to anchor: NSLayoutXAxisAnchor, const: CGFloat = 0) -> UIView {
        self.trailingAnchor.constraint(equalTo: anchor, constant: const).isActive = true
        return self
    }
    
    @discardableResult func top(to anchor: NSLayoutYAxisAnchor, const: CGFloat = 0) -> UIView {
        self.topAnchor.constraint(equalTo: anchor, constant: const).isActive = true
        return self
    }
    
    @discardableResult func bottom(to anchor: NSLayoutYAxisAnchor, const: CGFloat = 0) -> UIView {
        self.bottomAnchor.constraint(equalTo: anchor, constant: const).isActive = true
        return self
    }
}
