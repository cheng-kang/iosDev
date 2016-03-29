//
//  AnimatingImageButton.swift
//  Weibo
//
//  Created by Ant on 3/28/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class AnimatingImageButton: UIImageView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.1) { () -> Void in
            self.transform = CGAffineTransformMakeScale(1.1, 1.1)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let position = touch!.locationInView(self.superview)
        if CGRectContainsPoint(self.frame, position) {
            UIView.animateWithDuration(0.1) { () -> Void in
                self.transform = CGAffineTransformMakeScale(1.8, 1.8)
            }
        } else {
            UIView.animateWithDuration(0.1) { () -> Void in
                self.transform = CGAffineTransformMakeScale(1, 1)
            }
        }
    }

}
