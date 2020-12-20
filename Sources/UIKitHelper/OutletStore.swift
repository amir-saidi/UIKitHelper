//
//  File.swift
//  
//
//  Created by Amir Saidi on 2/15/20.
//


import UIKit

// MARK: - View

func getUIView(frame: CGRect = .zero, backgroundColor: UIColor = .clear, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0, isUserInteractionEnabled: Bool = false, alpha: CGFloat = 1, isHidden: Bool = false, clipToBounds: Bool = false) -> UIView {
    let view = UIView(frame: frame)
    view.backgroundColor = backgroundColor
    view.layer.borderWidth = borderWidth
    view.layer.borderColor = borderColor.cgColor
    view.layer.cornerRadius = cornerRadius
    view.isUserInteractionEnabled = isUserInteractionEnabled
    view.alpha = alpha
    view.isHidden = isHidden
    view.clipsToBounds = clipToBounds
    return view
}


// MARK: - Fields

@available(iOS 8.2, *)
func getUILabel(text: String, size:CGFloat = 17, weight:UIFont.Weight = .regular, alignment: NSTextAlignment = .natural,  color: UIColor? = nil, numberOfLines: NSInteger = 1, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0, alpha: CGFloat = 1, isHidden: Bool = false, isUserInteractionEnabled: Bool = false) -> UILabel {
    let label = UILabel()
    label.font = .systemFont(ofSize: size, weight: weight)
    label.text = text
    label.textAlignment = alignment
    label.textColor = color != nil ? color : label.textColor
    label.numberOfLines = numberOfLines
    label.layer.borderWidth = borderWidth
    label.layer.borderColor = borderColor.cgColor
    label.layer.cornerRadius = cornerRadius
    label.alpha = alpha
    label.isHidden = isHidden
    label.isUserInteractionEnabled = isUserInteractionEnabled
    return label
}

@available(iOS 13.0, *)
func getUITextField(placeholder: String, font: UIFont = .systemFont(ofSize: 17), keyboardType: UIKeyboardType = .default, secureEntry: Bool = false, textAlignment: NSTextAlignment = .natural,  textColor: UIColor? = .label, backgroundColor: UIColor? = .systemBackground,  enabled: Bool = true, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0, alpha: CGFloat = 1, isHidden: Bool = false, userInteractionEnabled: Bool = true, delegate: UITextFieldDelegate? = nil) -> UITextField {
    let textField = UITextField(frame: .zero)
    textField.placeholder = placeholder
    textField.font = font
    textField.isSecureTextEntry = secureEntry
    textField.isEnabled = enabled
    textField.isUserInteractionEnabled = userInteractionEnabled
    textField.keyboardType = keyboardType
    textField.alpha = alpha
    textField.isHidden = isHidden
    textField.textAlignment = textAlignment
    textField.layer.borderWidth = borderWidth
    textField.layer.borderColor = borderColor.cgColor
    textField.layer.cornerRadius = cornerRadius
    textField.textColor = textColor
    textField.backgroundColor = backgroundColor
    textField.delegate = delegate
    return textField
}


func getUITextView(text: String = "", font: UIFont = .systemFont(ofSize: 17), scrollEnabled: Bool = true, editable: Bool = true, textAlignment: NSTextAlignment = .justified, textColor: UIColor? = nil, backgroundColor: UIColor? = nil,  borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0,  alpha: CGFloat = 1, isHidden: Bool = false) -> UITextView {
    let textView = UITextView()
    textView.text = text
    textView.font = font
    textView.isScrollEnabled = scrollEnabled
    textView.isEditable = editable
    textView.textAlignment = .justified
    textView.textColor = textColor != nil ? textColor : textView.textColor
    textView.backgroundColor = backgroundColor != nil ? backgroundColor : textView.backgroundColor
    textView.layer.borderWidth = borderWidth
    textView.layer.borderColor = borderColor.cgColor
    textView.layer.cornerRadius = cornerRadius
    textView.alpha = alpha
    textView.isHidden = isHidden
    return textView
}


// MARK: - Buttons

func getSystemUIButton(frame: CGRect = .zero, title: String = "", image: UIImage? = nil, titleColor: UIColor = .systemBlue, backgroundColor: UIColor = .white, tintColor: UIColor = .clear,  borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0,  alpha: CGFloat = 1, isHidden: Bool = false, enabled: Bool = true) -> UIButton {
    let button = UIButton(type: .system)
    button.frame = frame
    if image != nil { button.setImage(image, for: .normal) }
    button.backgroundColor = backgroundColor
    button.tintColor = tintColor
    button.setTitle(title, for: .normal)
    button.setTitleColor(titleColor, for: .normal)
    button.layer.borderWidth = borderWidth
    button.layer.borderColor = borderColor.cgColor
    button.layer.cornerRadius = cornerRadius
    button.alpha = alpha
    button.isHidden = isHidden
    button.isEnabled = enabled
    return button
}

func getUIButton(frame: CGRect = .zero, title: String = "", image: UIImage? = nil, titleColor: UIColor = .systemBlue, backgroundColor: UIColor = .white, tintColor: UIColor = .clear, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0,  alpha: CGFloat = 1, isHidden: Bool = false, enabled: Bool = true) -> UIButton {
    let button = UIButton(frame: frame)
    if image != nil { button.setImage(image, for: .normal) }
    button.backgroundColor = backgroundColor
    button.tintColor = tintColor
    button.setTitle(title, for: .normal)
    button.setTitleColor(titleColor, for: .normal)
    button.layer.borderWidth = borderWidth
    button.layer.borderColor = borderColor.cgColor
    button.layer.cornerRadius = cornerRadius
    button.alpha = alpha
    button.isHidden = isHidden
    button.isEnabled = enabled
    return button
}


// MARK: - Image

func getUIImageView(image: UIImage? = nil, contentMode: UIView.ContentMode = .scaleAspectFill, clipped: Bool = false, backgroundColor: UIColor = .clear, tintColor: UIColor = .clear, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0,  alpha: CGFloat = 1, isHidden: Bool = false, isUserInteractionEnabled: Bool  = false) -> UIImageView {
    let imageView = UIImageView()
    imageView.clipsToBounds = clipped
    imageView.backgroundColor = backgroundColor
    imageView.tintColor = tintColor
    imageView.layer.borderColor = borderColor.cgColor
    imageView.layer.borderWidth = borderWidth
    imageView.contentMode = contentMode
    imageView.layer.cornerRadius = cornerRadius
    imageView.isUserInteractionEnabled = isUserInteractionEnabled
    imageView.alpha = alpha
    imageView.isHidden = isHidden
    if image != nil { imageView.image = image }
    return imageView
}


// MARK: - Stack

@available(iOS 9.0, *)
func HStack(subviews: [UIView]?, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) -> UIStackView {
    let stackView = subviews == nil ? UIStackView() : UIStackView(arrangedSubviews: subviews!)
    stackView.axis = .horizontal
    stackView.alignment = alignment
    stackView.distribution = distribution
    stackView.spacing = spacing
    return stackView
}

@available(iOS 9.0, *)
func VStack(subviews: [UIView]?, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) -> UIStackView {
    let stackView = subviews == nil ? UIStackView() : UIStackView(arrangedSubviews: subviews!)
    stackView.axis = .vertical
    stackView.alignment = alignment
    stackView.distribution = distribution
    stackView.spacing = spacing
    return stackView
}

