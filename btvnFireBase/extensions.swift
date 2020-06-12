//
//  extensions.swift
//  btvnFireBase
//
//  Created by Huy on 6/5/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit
extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingRight:CGFloat, paddingLeft:CGFloat, paddingBottom: CGFloat, width: CGFloat, height: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    func textContainerView(view: UIView, _ image: UIImage, _ textField: UITextField) -> UIView{
        view.backgroundColor = .clear
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.07
        view.addSubview(imageView)
        imageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingRight: 0, paddingLeft: 10, paddingBottom: 0, width: 24, height: 24)
        imageView.addSubview(textField)
        textField.anchor(top: nil, left: imageView.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingRight: 8, paddingLeft: 12, paddingBottom: 0, width: 0, height: 0)
        let underText = UIView()
        underText.backgroundColor = UIColor(white: 1, alpha: 0.87 )
        
        view.addSubview(underText)
        underText.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingRight: 8, paddingLeft: 0, paddingBottom: 0, width: 0, height: 1)
        return view
    }
    
}

extension UIColor{
    static func rbg(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static func mainBlue() -> UIColor {
        return UIColor.rbg(red: 0, green: 150, blue: 255)
    }
}
extension UITextField {
    func textField(placeholder: String, isSecure: Bool) -> UITextField{
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.isSecureTextEntry = isSecure
        tf.textColor = .white
        tf.attributedPlaceholder = NSAttributedString(
            string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return tf
    }
}
