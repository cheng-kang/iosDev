//
//  BIView.swift
//  WrittingPad
//
//  Created by Ant on 16/9/10.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class BIView: UIView {

    let path = UIBezierPath()
    var incrementalImage: UIImage?
    var pts:[CGPoint] = [CGPointZero, CGPointZero, CGPointZero, CGPointZero]
    var ctr = 0
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        path.lineWidth = 5
        
        incrementalImage?.drawInRect(rect)
        path.stroke()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        ctr = 0;
        let t = touches.first!
        pts[0] = t.locationInView(self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let t = touches.first!
        let p = t.locationInView(self)
        ctr++
        pts[ctr] = p
        
        if ctr == 3 {
            path.moveToPoint(pts[0])
            path.addCurveToPoint(pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
            self.setNeedsDisplay()
            pts[0] = path.currentPoint
            ctr = 0
        }
    }
 
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.drawBitmap()
        self.setNeedsDisplay()
        pts[0] = path.currentPoint
        path.removeAllPoints()
        ctr = 0
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
