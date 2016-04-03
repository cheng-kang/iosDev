//
//  RoundImage.swift
//  Instagram
//
//  Created by Ant on 4/3/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 1
        self.layer.borderColor = COLOR_GREY.CGColor
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    

}
