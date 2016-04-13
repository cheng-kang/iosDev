//
//  RoundedCornerRectView.swift
//  FenghuangXinwen
//
//  Created by Ant on 4/13/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class RoundedCornerRectView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.width / 4
        self.layer.borderColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).CGColor
        self.layer.borderWidth = 0.5
    }
}
