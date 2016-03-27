//
//  TopBar.swift
//  Weibo
//
//  Created by Ant on 3/27/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class TopBar: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowOffset = CGSizeMake(0, 0)
        self.layer.shadowColor = UIColor.lightGrayColor().CGColor
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 1        
        self.layer.backgroundColor = LIGHT_GREY_COLOR.CGColor
        self.backgroundColor = LIGHT_GREY_COLOR
    }

}
