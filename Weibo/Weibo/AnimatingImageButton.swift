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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) 
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let position = touch!.location(in: self.superview)
        if self.frame.contains(position) {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            }) 
        } else {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) 
        }
    }

}
