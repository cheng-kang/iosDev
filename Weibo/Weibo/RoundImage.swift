//
//  RoundImage.swift
//  Weibo
//
//  Created by Ant on 3/27/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {
    
    //    override func drawRect(rect: CGRect) {
    ////        self.layer.shadowColor =
    //
    //
    ////        self.clipsToBounds = true
    //    }
    
    override func awakeFromNib() {
        
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func initColorCircle(_ radius: CGFloat, color: UIColor) {
        self.frame.size.width = radius
        self.frame.size.height = radius
        self.backgroundColor = color
    }
}
