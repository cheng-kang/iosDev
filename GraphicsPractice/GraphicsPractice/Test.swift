//
//  Test.swift
//  GraphicsPractice
//
//  Created by Ant on 5/18/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class Test: UIView {

    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let path = NSBundle.mainBundle().pathForResource("img", ofType: "png")
        let img = UIImage(named: "img")
        let image = img!.CGImage
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextRotateCTM(context, CGFloat(45.0 * M_PI / 180.0))
        
//        CGContextRotateCTM(context, CGFloat(-45.0 * M_PI / 180.0)
        
        let touchRect = CGRectMake(300.0, 100.0, 200.0, 200.0)
        
        CGContextDrawImage(context, touchRect, image)
        
        CGContextRestoreGState(context)
        
    }

}
