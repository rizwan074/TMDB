//
//  UIViewExtension.swift
//  TMDB
//
//  Created by Rizwan Mehmood on 24/08/2023.
//

import Foundation
import UIKit



extension UIView {
    
    func addShadow() {
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    func cornerStylish(color : UIColor, borderWidth: CGFloat, cornerRadius : CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
    
    func roundCorner(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.layer.masksToBounds = false
    }
    
    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
        clipsToBounds = false
    }
    
    func addBlurShadow(x: Int = 0,y: Int = 2, blur: CGFloat = 40, spreed: Int = 4, opacity: Float = 0.15, color: UIColor ){
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = blur
    }
    
}
