//
//  File.swift
//  
//
//  Created by Amir Saidi on 2/15/20.
//


import UIKit

// MARK: - View

public func getUIView(frame: CGRect = .zero, backgroundColor: UIColor = .clear, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UIView {
    let view = UIView(frame: frame)
    view.backgroundColor = backgroundColor
    view.layer.borderWidth = borderWidth
    view.layer.borderColor = borderColor.cgColor
    view.layer.cornerRadius = cornerRadius
    return view
}


// MARK: - Fields

@available(iOS 8.2, *)
public func getUILabel(text: String, size:CGFloat = 17, weight:UIFont.Weight = .regular, color: UIColor? = nil, numberOfLines: NSInteger = 1, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UILabel {
    let label = UILabel()
    label.font = .systemFont(ofSize: size, weight: weight)
    label.text = text
    label.textColor = color != nil ? color : label.textColor
    label.numberOfLines = numberOfLines
    label.layer.borderWidth = borderWidth
    label.layer.borderColor = borderColor.cgColor
    label.layer.cornerRadius = cornerRadius
    return label
}

public func getUITextField(placeholder: String, keyboardType: UIKeyboardType = .default, secureEntry: Bool = false) -> UITextField {
    let textField = UITextField(frame: .zero)
    textField.placeholder = placeholder
    textField.isSecureTextEntry = secureEntry
    textField.keyboardType = keyboardType
    return textField
}


public func getUITextView(text: String = "", font: UIFont = .systemFont(ofSize: 17), scrollEnabled: Bool = true, textAlignment: NSTextAlignment = .justified, textColor: UIColor? = nil, backgroundColor: UIColor? = nil,  borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UITextView {
    let textView = UITextView()
    textView.text = text
    textView.font = font
    textView.isScrollEnabled = scrollEnabled
    textView.textAlignment = .justified
    textView.textColor = textColor != nil ? textColor : textView.textColor
    textView.backgroundColor = backgroundColor != nil ? backgroundColor : textView.backgroundColor
    textView.layer.borderWidth = borderWidth
    textView.layer.borderColor = borderColor.cgColor
    textView.layer.cornerRadius = cornerRadius
    return textView
}


// MARK: - Buttons

public func getSystemUIButton(title: String = "", image: UIImage? = nil, titleColor: UIColor = .systemBlue, backgroundColor: UIColor = .white, tintColor: UIColor = .clear,  borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UIButton {
    let button = UIButton(type: .system)
    if image != nil { button.imageView?.image = image }
    button.backgroundColor = backgroundColor
    button.tintColor = tintColor
    button.setTitle(title, for: .normal)
    button.setTitleColor(titleColor, for: .normal)
    button.layer.borderWidth = borderWidth
    button.layer.borderColor = borderColor.cgColor
    button.layer.cornerRadius = cornerRadius
    return button
}

public func getUIButton(title: String = "", image: UIImage? = nil, titleColor: UIColor = .systemBlue, backgroundColor: UIColor = .white, tintColor: UIColor = .clear, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UIButton {
    let button = UIButton()
    if image != nil { button.imageView?.image = image }
    button.backgroundColor = backgroundColor
    button.tintColor = tintColor
    button.setTitle(title, for: .normal)
    button.setTitleColor(titleColor, for: .normal)
    button.layer.borderWidth = borderWidth
    button.layer.borderColor = borderColor.cgColor
    button.layer.cornerRadius = cornerRadius
    return button
}


// MARK: - Image

public func getUIImageView(image: UIImage? = nil, contentMode: UIView.ContentMode = .scaleAspectFill, clipped: Bool = false, backgroundColor: UIColor = .clear, tintColor: UIColor = .clear, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UIImageView {
    let imageView = UIImageView()
    imageView.clipsToBounds = clipped
    imageView.backgroundColor = backgroundColor
    imageView.tintColor = tintColor
    imageView.layer.borderColor = borderColor.cgColor
    imageView.layer.borderWidth = borderWidth
    imageView.contentMode = contentMode
    imageView.layer.cornerRadius = cornerRadius
    if image != nil { imageView.image = image }
    return imageView
}


// MARK: - Stack

@available(iOS 9.0, *)
public func HStack(subviews: [UIView]?, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) -> UIStackView {
    let stackView = subviews == nil ? UIStackView() : UIStackView(arrangedSubviews: subviews!)
    stackView.axis = .horizontal
    stackView.alignment = alignment
    stackView.distribution = distribution
    stackView.spacing = spacing
    return stackView
}

@available(iOS 9.0, *)
public func VStack(subviews: [UIView]?, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) -> UIStackView {
    let stackView = subviews == nil ? UIStackView() : UIStackView(arrangedSubviews: subviews!)
    stackView.axis = .vertical
    stackView.alignment = alignment
    stackView.distribution = distribution
    stackView.spacing = spacing
    return stackView
}

