//
//  BorderedButton.swift
//  Instagram
//
//  Created by Ant on 4/3/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit
import Foundation

class BorderedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.layer.borderColor = UIColor.grayColor().CGColor
//        self.layer.borderWidth = 1
        self.tintColor = COLOR_BLUE
    }
}
