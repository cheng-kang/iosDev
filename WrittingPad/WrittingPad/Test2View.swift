//
//  Test2View.swift
//  WrittingPad
//
//  Created by Ant on 16/9/10.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class Test2View: UIView {
    
    let path = UIBezierPath()
    var incrementalImage: UIImage?
    var pts = [CGPointZero, CGPointZero, CGPointZero, CGPointZero, CGPointZero]
    var timestamps = [NSDate(), NSDate(), NSDate(), NSDate(), NSDate()]
    var vels: [CGFloat] = [0.0, 0.0, 0.0, 0.0, 0.0]
    var ctr = 0
    
    var paths = [UIBezierPath]()
    var pathsWidth = [CGFloat]()
    
    var lastVel: CGFloat = 0
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        //        var width = vels[3] / 166
        //        width = width > 10 ? 10 : width < 1 ? 1 : width
        //
        //        path.lineWidth = width
        
        incrementalImage?.drawInRect(rect)
        //        path.lineCapStyle = .Round
        //        path.stroke()
        
        for i in 0..<paths.count {
            let path = paths[i]
            path.lineWidth = pathsWidth[i]
            path.lineCapStyle = .Round
            path.lineJoinStyle = .Round
            UIColor.blueColor().setStroke()
            path.stroke()
        }
        
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(TestView.handlePan(_:)))
//        self.addGestureRecognizer(pan)
    }
    
//    func handlePan(sender: UIPanGestureRecognizer) {
//        if sender.state == .Began {
//            ctr = 0
//            pts[0] = sender.locationInView(self)
//            
//            let vel = sender.velocityInView(self)
//            vels[0] = sqrt(pow(vel.x, 2) + pow(vel.y, 2))
//            print(vels[0])
//            
//        } else if sender.state == .Changed {
//            let p = sender.locationInView(self)
//            ctr += 1
//            pts[ctr] = p
//            
//            let vel = sender.velocityInView(self)
//            vels[ctr] = sqrt(pow(vel.x, 2) + pow(vel.y, 2))
//            print(vels[ctr])
//            
//            if ctr == 4 {
//                
//                pts[3] = CGPointMake((pts[2].x + pts[4].x)/2, (pts[2].y + pts[4].y)/2)
//                
//                let p = UIBezierPath()
//                self.paths.append(p)
//                
//                p.moveToPoint(self.pts[0])
//                p.addCurveToPoint(self.pts[3], controlPoint1: self.pts[1], controlPoint2: self.pts[2])
//                
//                
//                var width = self.vels[2] / 80
//                width = width > 10 ? 10 : width < 1 ? 1 : width
//                
//                //                width = 10 - width
//                
//                print("Last Width: \(lastVel)")
//                print("Current Width: \(width)")
//                
//                if lastVel != 0 {
//                    width = width * 0.2 + lastVel * 0.8
//                }
//                
//                lastVel = width
//                
//                self.pathsWidth.append(width)
//                
//                //                path.moveToPoint(pts[0])
//                //                path.addCurveToPoint(pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
//                
//                self.setNeedsDisplay()
//                //                path.removeAllPoints()
//                
//                pts[0] = pts[3]
//                pts[1] = pts[4]
//                vels[0] = vels[3]
//                vels[1] = vels[4]
//                ctr = 1
//                
//            }
//        } else if sender.state == .Ended {
//            self.drawBitmap()
//            self.setNeedsDisplay()
//            for path in paths {
//                path.removeAllPoints()
//            }
//            paths.removeAll()
//            ctr = 0
//            
//            let vel = sender.velocityInView(self)
//            print(sqrt(pow(vel.x, 2) + pow(vel.y, 2)))
//        }
//    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        ctr = 0
        let t = touches.first!
        pts[0] = t.locationInView(self)
        timestamps[0] = NSDate()
        vels[0] = 0
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let t = touches.first!
        let p = t.locationInView(self)
        ctr += 1
        pts[ctr] = p
        timestamps[ctr] = NSDate()
        let distance = sqrt(pow(pts[ctr].x - pts[ctr-1].x, 2) + pow(pts[ctr].y - pts[ctr-1].y, 2))
        let time = timestamps[ctr].timeIntervalSinceDate(timestamps[ctr-1])
        vels[ctr] = distance / CGFloat(time)
        print(vels[ctr])
        if ctr == 4 {
            pts[3] = CGPointMake((pts[2].x + pts[4].x)/2, (pts[2].y + pts[4].y)/2)
            
            let p = UIBezierPath()
            self.paths.append(p)
            
            p.moveToPoint(self.pts[0])
            p.addCurveToPoint(self.pts[3], controlPoint1: self.pts[1], controlPoint2: self.pts[2])
            
            
            var width = self.vels[2] / 80
            width = width > 10 ? 10 : width < 1 ? 1 : width
            
            print("Last Width: \(lastVel)")
            print("Current Width: \(width)")
            
            if lastVel != 0 {
                width = width * 0.2 + lastVel * 0.8
            }
            
            lastVel = width
            
            self.pathsWidth.append(width)
            
            self.setNeedsDisplay()
            
            pts[0] = pts[3]
            pts[1] = pts[4]
            vels[0] = vels[3]
            vels[1] = vels[4]
            ctr = 1
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.drawBitmap()
        self.setNeedsDisplay()
        for path in paths {
            path.removeAllPoints()
        }
        paths.removeAll()
        ctr = 0
    }
    
    func drawBitmap() {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        
        if (incrementalImage == nil) {
            let rectpath = UIBezierPath(rect: self.bounds)
            UIColor.whiteColor().setFill()
            rectpath.fill()
        }
        incrementalImage?.drawAtPoint(CGPointZero)
        for i in 0..<paths.count {
            let path = paths[i]
            path.lineWidth = pathsWidth[i]
            path.lineCapStyle = .Round
            path.lineJoinStyle = .Round
            UIColor.blueColor().setStroke()
            path.stroke()
        }
        
        incrementalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}
