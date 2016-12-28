//
//  TDanmuManager.swift
//  Danmu
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import Foundation
import UIKit

class TDanmuManager: NSObject {
    private var view: UIView!
    private var top: CGFloat!
    private var bottom: CGFloat!
    
    private var enteringQueue: [DanmuModel] = [DanmuModel]()
    private var waitingQueue: [DanmuModel] = [DanmuModel]()
    
    private var duration: Double = 5
    private var screenSize = UIScreen.main.bounds.size
    private var speed: CGFloat = 120
    
    init(_ view: UIView, top: CGFloat, bottom: CGFloat) {
        self.view = view
        self.top = top
        self.bottom = bottom
        
        super.init()
    }
    
    init(_ view: UIView, top: CGFloat, bottom: CGFloat, duration: Double) {
        self.view = view
        self.top = top
        self.bottom = bottom
        self.duration = duration
        
        super.init()
    }
    
    func add(_ danmu: DanmuModel) {
        // topY: the top position of current Danmu (relative to container)
        // bottomY: the bottom position of current Danmu (relative to container)
        let topY: CGFloat = danmu.topY
        let bottomY: CGFloat = danmu.topY + danmu.size.height
        
        danmu.shot = {
            self.enteringQueue.append(danmu)
            
            self.view.addSubview(danmu.danmuView!)
            danmu.danmuView?.layer.borderColor = UIColor.black.cgColor
            danmu.danmuView?.layer.borderWidth = 1
            danmu.danmuView!.frame = CGRect(x: self.screenSize.width, y: danmu.topY + self.top, width: danmu.size.width, height: danmu.size.height)
            
            let totalDistance = danmu.size.width + self.view.frame.width
            let totalTime = Double(totalDistance / self.speed)
            let enteringTime = Double(danmu.size.width / self.speed)
            
            UIView.animate(withDuration: totalTime, delay: 0, options: [.curveLinear], animations: {
                danmu.danmuView!.center = CGPoint(x: -danmu.size.width/2, y: danmu.size.height/2 + danmu.topY + self.top)
            }, completion: { (success) in
                // Danmu didDisappear
                danmu.prepareToDeinit()
            })
            
            Timer.scheduledTimer(withTimeInterval: enteringTime, repeats: false, block: { (timer) in
                // Danmu didEnter
                danmu.notifyNextDanmu()
                let index = self.enteringQueue.index(of: danmu)
                self.enteringQueue.remove(at: index!)
            })
        }
        
        // Check if target range is occupied
        for item in enteringQueue {
            
            var list = item.getNextDanmuList()
            
            while(list.count > 0) {
                let lastInList = list.popLast()
                
                let (itemTopY, itemBottomY) = lastInList!.getOccupiedRange()
                
                if (topY > itemTopY && topY < itemBottomY) || (bottomY > itemTopY && bottomY < itemBottomY) {
                    // if target range is occupied, add this Danmu to the queue
                    item.setNextDanmu(danmu)
                    danmu.updatePrecedingDanmuCount(1)
                    
                    break
                }
            }
        }
        
        // if target range is clear, shot!
        if danmu.precedingDanmuCount == 0 {
            danmu.shot!()
        }
    }
    
    func addRandom() {
        
    }
    
    
    //
    // Pause / Resume UIView.animation
    // Thanks to t4nhpt from StackOverflow
    // http://stackoverflow.com/questions/33994520/how-to-pause-and-resume-uiview-animatewithduration
    //
    func pause() {
        let layer = self.view.layer
        let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }
    
    func resume() {
        let layer = self.view.layer
        let pausedTime: CFTimeInterval = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
    //
    // End of Pause / Resume UIView.animation
    //
}
