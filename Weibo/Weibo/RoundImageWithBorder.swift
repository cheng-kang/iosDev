//
//  RoundedImage.swift
//  Weibo
//
//  Created by Ant on 3/26/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class RoundImageWithBorder: UIImageView {

//    override func drawRect(rect: CGRect) {
////        self.layer.shadowColor = 
//        
//        
////        self.clipsToBounds = true
//    }
    
    override func awakeFromNib() {
        
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.borderColor = LIGHT_GREY_COLOR.CGColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
    }

    func initView() {
        self.image = UIImage(named: "avatar")
    }
}
