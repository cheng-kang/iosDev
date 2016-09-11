//
//  CLIView.swift
//  WrittingPad
//
//  Created by Ant on 16/9/10.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class CLIView: UIView {

    let path = UIBezierPath()
    var incrementalImage: UIImage?
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        incrementalImage?.drawInRect(rect)
        path.lineWidth = 5
        
        
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
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let t = touches.first!
        let p = t.locationInView(self)
        path.addLineToPoint(p)
        self.drawBitmap()
        self.setNeedsDisplay()
        path.removeAllPoints()
    }
    
    func drawBitmap() {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        UIColor.blueColor().setStroke()
        if (incrementalImage == nil) {
            let rectpath = UIBezierPath(rect: self.bounds)
            UIColor.whiteColor().setFill()
            rectpath.fill()
        }
        incrementalImage?.drawAtPoint(CGPointZero)
        path.stroke()
        incrementalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

}
