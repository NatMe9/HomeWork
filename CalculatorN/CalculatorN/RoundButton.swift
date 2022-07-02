//
//  RoundButton.swift
//  CalculatorN
//
//  Created by Natalia Givojno on 27.06.22.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerR: Bool = false {
        didSet {
            if cornerR {
                layer.cornerRadius = frame.height / 2
                
            }
        }
    }
    
     func dobVInterFace () {
        if cornerR {
            layer.cornerRadius = frame.height / 2
        }
    }
    
}
