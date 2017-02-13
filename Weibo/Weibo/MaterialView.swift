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
        
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowColor = UIColor.lightGray.cgColor;
        self.layer.shadowRadius = 0.5
        self.layer.shadowOpacity = 0.3
        self.clipsToBounds = false
    }

}
