//
//  Pet.swift
//  My Rock Pet
//
//  Created by Ant on 3/11/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class Pet: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playAliveAnimation()
    }
    
    func playAliveAnimation() {
        self.image = UIImage(named: "idle1.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var x = 1; x <= 4; x++ {
            imgArray.append(UIImage(named: "idle\(x).png")!)
        }
        
        self.animationImages = imgArray
        self.animationRepeatCount = 0
        self.animationDuration = 0.8
        
        self.startAnimating()
    }
    
    func playDeadAnimation() {
        self.image = UIImage(named: "dead5.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var x = 1; x <= 5; x++ {
            imgArray.append(UIImage(named: "dead\(x).png")!)
        }
        
        self.animationImages = imgArray
        self.animationRepeatCount = 1
        self.animationDuration = 0.8
        
        self.startAnimating()
    }
}
