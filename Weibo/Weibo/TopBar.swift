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
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 1        
        self.layer.backgroundColor = COLOR_LIGHT_GREY.cgColor
        self.backgroundColor = COLOR_LIGHT_GREY
    }

}
