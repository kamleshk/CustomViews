//
//  CustomView.swift
//  customi
//
//  Created by Kamalesh Kumar Yadav on 25/02/19.
//  Copyright © 2019 Kamalesh Kumar Yadav. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // for setting radius of view
    @IBInspectable var corenerRadius : CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
    // for setting border and its width
    @IBInspectable var borderWidth : CGFloat  {
        
        set{
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    // for setting border color
    @IBInspectable var borderColor : UIColor? {
        set{
            if let color = newValue {
             layer.borderColor = color.cgColor
            }else {
                layer.borderColor = nil
            }
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
     }
    
    // for seeting border shadow radius
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    // for setting transparency of shadow
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    //Mark ask for chsize
    // for shadow in left side give x in nagative value  and set y = 0
    // for right side give x positive greter > 0  y = 0
    //for Shadow top give y negative value and x=0
    //for bottom give give Y > 0 and x = 0
    // for left and top botom change x and y as per requirement
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    // seeting for shadow color
    @IBInspectable  var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    let gradientLayer = CAGradientLayer()
    @IBInspectable var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
    

}

extension UIView {
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 1
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}


class CustomButton: UIButton  {
    
}

class CustomTextField: UITextField {
    var bottomBorder = UIView()
    override func awakeFromNib() {
        
        //MARK: Setup Bottom-Border
        self.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bottomBorder.backgroundColor = UIColor.orange
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomBorder)
        //Mark: Setup Anchors
        bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBorder.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomBorder.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true // Set Border-Strength
    }
    
    
    // for setting radius of view
    @IBInspectable var corenerRadius : CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
    // for setting border and its width
    @IBInspectable var borderWidth : CGFloat  {
        
        set{
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    // for setting border color
    @IBInspectable var borderColor : UIColor? {
        set{
            if let color = newValue {
                layer.borderColor = color.cgColor
            }else {
                layer.borderColor = nil
            }
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
    }
    
    // for seeting border shadow radius
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    // for setting transparency of shadow
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    //Mark ask for chsize
    // for shadow in left side give x in nagative value  and set y = 0
    // for right side give x positive greter > 0  y = 0
    //for Shadow top give y negative value and x=0
    //for bottom give give Y > 0 and x = 0
    // for left and top botom change x and y as per requirement
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    // seeting for shadow color
    @IBInspectable  var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable var leftImage: String = String(){
        didSet{
            leftViewMode = UITextField.ViewMode.always
            leftView = UIImageView(image: UIImage(named: leftImage))
           // leftView?.backgroundColor = UIColor.green
        }
    }
    
    
    @IBInspectable var rightImage: String = String(){
        didSet{
            rightViewMode = UITextField.ViewMode.always
            let img = UIImageView(image: UIImage(named: rightImage))
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.clearTextField))
            img.addGestureRecognizer(tapGestureRecognizer)
            img.isUserInteractionEnabled = true
             rightView = img
        }
    }

// clearing textfield
    @objc func clearTextField() {
        //self.shake()
        self.text = ""
    }
    
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
}
