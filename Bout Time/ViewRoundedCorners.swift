//
//  ViewRoundedCorners.swift
//  Bout Time
//
//  Created by Michael Guatambu Davis on 3/31/17.
//  Copyright © 2017 leme group. All rights reserved.
//

// adds options for round corners and border specs in interface builder

import UIKit


@IBDesignable
class ViewRoundedCorners: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0    {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
        
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
        
        
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}
