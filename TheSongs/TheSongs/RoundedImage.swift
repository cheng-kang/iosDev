//
//  RoundedImage.swift
//  TheSongs
//
//  Created by Ant on 5/19/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {

    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
