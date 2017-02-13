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
        
        for i in 1...4 {
            imgArray.append(UIImage(named: "idle\(i).png")!)
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
        
        for i in 1...5 {
            imgArray.append(UIImage(named: "dead\(i).png")!)
        }
        
        self.animationImages = imgArray
        self.animationRepeatCount = 1
        self.animationDuration = 0.8
        
        self.startAnimating()
    }
}
