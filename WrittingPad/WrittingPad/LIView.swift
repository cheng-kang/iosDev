//
//  LIView.swift
//  WrittingPad
//
//  Created by Ant on 16/9/10.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class LIView: UIView {

    let path = UIBezierPath()
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        path.lineWidth = 10
        
        UIColor.blueColor().setStroke()
        path.stroke()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let t = touches.first!
        let p = t.locationInView(self)
        path.moveToPoint(p)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let t = touches.first!
        let p = t.locationInView(self)
        path.addLineToPoint(p)
        
        self.setNeedsDisplay()
    }
}
