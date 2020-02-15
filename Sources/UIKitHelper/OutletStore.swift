//
//  File.swift
//  
//
//  Created by Amir Saidi on 2/15/20.
//


import UIKit

// MARK: - Fields

func getUILabel(text: String, size:CGFloat = 17, weight:UIFont.Weight = .regular, color: UIColor = AppColors.text.color, numberOfLines: NSInteger = 1) -> UILabel {
    let lbl = UILabel()
    lbl.font = .systemFont(ofSize: size, weight: weight)
    lbl.text = text
    lbl.textColor = color
    lbl.numberOfLines = numberOfLines
    return lbl
}

func getUITextField(placeholder: String, keyboardType: UIKeyboardType = .default, secureEntry: Bool = false) -> UITextField {
    let txf = UITextField(frame: .zero)
    txf.placeholder = placeholder
    txf.isSecureTextEntry = secureEntry
    txf.keyboardType = keyboardType
    return txf
}


// MARK: - Buttons

func getSystemUIButton(title: String, titleColor: UIColor = .systemBlue, backgroundColor: UIColor = .white, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UIButton {
    let btn = UIButton(type: .system)
    btn.backgroundColor = backgroundColor
    btn.setTitle(title, for: .normal)
    btn.setTitleColor(titleColor, for: .normal)
    btn.layer.borderWidth = borderWidth
    btn.layer.borderColor = borderColor.cgColor
    btn.layer.cornerRadius = cornerRadius
    return btn
}

func getUIButton(title: String, titleColor: UIColor = .systemBlue, backgroundColor: UIColor = .white, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UIButton {
    let btn = UIButton()
    btn.backgroundColor = backgroundColor
    btn.setTitle(title, for: .normal)
    btn.setTitleColor(titleColor, for: .normal)
    btn.layer.borderWidth = borderWidth
    btn.layer.borderColor = borderColor.cgColor
    btn.layer.cornerRadius = cornerRadius
    return btn
}


// MARK: - Stack

func HStack(subviews: [UIView]?, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 10) -> UIStackView {
    let stack = subviews == nil ? UIStackView() : UIStackView(arrangedSubviews: subviews!)
    stack.axis = .horizontal
    stack.alignment = alignment
    stack.distribution = distribution
    stack.spacing = spacing
    return stack
}

func VStack(subviews: [UIView]?, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 10) -> UIStackView {
    let stack = subviews == nil ? UIStackView() : UIStackView(arrangedSubviews: subviews!)
    stack.axis = .vertical
    stack.alignment = alignment
    stack.distribution = distribution
    stack.spacing = spacing
    return stack
}

