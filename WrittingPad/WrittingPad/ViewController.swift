//
//  ViewController.swift
//  WrittingPad
//
//  Created by Ant on 16/9/9.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let dot = UIImageView(image: UIImage(named: "dot")!)
//        dot.backgroundColor = UIColor.clearColor()
//        dot.frame.size = CGSizeMake(12, 8.5)
//        dot.center = CGPointMake(100, 100)
//        
//        self.view.addSubview(dot)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var lastPoint: CGPoint!
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        
        startPoint = touch.locationInView(self.view)
        
        let dot = UIImageView(image: UIImage(named: "dot4")!)
//        dot.alpha = 0.8
        dot.backgroundColor = UIColor.clearColor()
        dot.frame.size = CGSizeMake(25, 22)
        dot.center = startPoint
        
        self.view.addSubview(dot)
        
        lastPoint = startPoint
        print(lastPoint)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let point = touch.locationInView(self.view)
        
        let n = ceil(sqrt(pow((point.x - lastPoint.x), 2) + pow((point.y - lastPoint.y), 2)) / 0.1)
        let xDif = abs(point.x - lastPoint.x)
        let yDif = abs(point.y - lastPoint.y)
        for i in 0..<Int(n) {
            let dot = UIImageView(image: UIImage(named: "dot4")!)
//            dot.alpha = 0.8
            dot.backgroundColor = UIColor.clearColor()
            dot.frame.size = CGSizeMake(25, 22)
            dot.center = CGPointMake(point.x + xDif/n*CGFloat(i), point.y + yDif/n*CGFloat(i))
            
            self.view.addSubview(dot)
        }
        
        lastPoint = point
        
        print(point)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first!
        let point = touch.locationInView(self.view)
        
        let n = ceil(sqrt(pow((point.x - lastPoint.x), 2) + pow((point.y - lastPoint.y), 2)) / 0.1)
        let xDif = abs(point.x - lastPoint.x)
        let yDif = abs(point.y - lastPoint.y)
        for i in 0..<Int(n) {
            let dot = UIImageView(image: UIImage(named: "dot4")!)
            //            dot.alpha = 0.8
            dot.backgroundColor = UIColor.clearColor()
            dot.frame.size = CGSizeMake(25, 22)
            dot.center = CGPointMake(point.x + xDif/n*CGFloat(i), point.y + yDif/n*CGFloat(i))
            
            self.view.addSubview(dot)
        }
        
        lastPoint = point
        print(lastPoint)
    }
    
//    @IBAction func panGestureTriggered(sender: UIPanGestureRecognizer) {
//        let tr = sender.translationInView(self.view)
//        let point = sender.locationInView(self.view)
//        print(tr)
//        
//        if sender.state == UIGestureRecognizerState.Began {
//            
//            startPoint = sender.locationInView(self.view)
//            lastPoint = sender.locationInView(self.view)
//            
//        } else if sender.state == UIGestureRecognizerState.Ended {
//            
//            endPoint = sender.locationInView(self.view)
//        }
//        
//        let dot = UIImageView(image: UIImage(named: "dot3")!)
//        dot.alpha = 0.8
//        dot.backgroundColor = UIColor.clearColor()
//        dot.frame.size = CGSizeMake(24, 10.5)
//        dot.center = point
//        
//        self.view.addSubview(dot)
//        
//        let n = ceil(sqrt(pow((point.x - lastPoint.x), 2) + pow((point.y - lastPoint.y), 2)) / 0.2)
//        let xDif = abs(point.x - lastPoint.x)
//        let yDif = abs(point.y - lastPoint.y)
//        for i in 0..<Int(n) {
//            let dot = UIImageView(image: UIImage(named: "dot3")!)
//            dot.alpha = 0.8
//            dot.backgroundColor = UIColor.clearColor()
//            dot.frame.size = CGSizeMake(11, 10.5)
//            dot.center = CGPointMake(point.x + xDif/n*CGFloat(i), point.y + yDif/n*CGFloat(i))
//            
//            self.view.addSubview(dot)
//        }
//        
//        lastPoint = sender.locationInView(self.view)
//    }

}

