//
//  MaterialView.swift
//  Weibo
//
//  Created by Ant on 3/28/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowOffset = CGSizeMake(0, 0.5)
        self.layer.shadowColor = UIColor.lightGrayColor().CGColor;
        self.layer.shadowRadius = 0.5
        self.layer.shadowOpacity = 0.3
        self.clipsToBounds = false
    }

}
