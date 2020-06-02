//
//  CalculatorButton.swift
//  CoolCalc
//
//  Created by Jay Phillips on 6/1/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

@IBDesignable class CalculatorButton: UIButton {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.layer.borderWidth = 1
    }
}
