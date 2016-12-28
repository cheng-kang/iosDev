//
//  DSDanmuManager.swift
//  Danmu
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import Foundation
import UIKit

class DSDanmuManager: NSObject {
    private var view: UIView!
    private var top: CGFloat!
    private var bottom: CGFloat!
    
    private var speed: CGFloat = 120
    
    private var defaultFont: UIFont = UIFont.systemFont(ofSize: 20)
    private var customFont: UIFont?
    var font: UIFont {
        return customFont == nil ? defaultFont : customFont!
    }
    
    private var lineHeight: CGFloat!
    private(set) var numberOfLines: Int!
    private var inUsingLines: [Bool] = [Bool]()
    private var enteringTimers: [Timer?] = [Timer?]()
    private var waitingQueues: [[DSDanmuModel]] = [[DSDanmuModel]]()
    private var taskTimer: Timer!
    
    init(with view: UIView) {
        self.view = view
        self.top = 0
        self.bottom = view.frame.height
        
        super.init()
        self.initConfigs()
    }
    
    init(with view: UIView, top: CGFloat, bottom: CGFloat) {
        self.view = view
        self.top = top
        self.bottom = bottom
        
        super.init()
        self.initConfigs()
    }
    
    init(with view: UIView, top: CGFloat, bottom: CGFloat, speed: CGFloat) {
        self.view = view
        self.top = top
        self.bottom = bottom
        self.speed = speed
        
        super.init()
        self.initConfigs()
    }
    
    func initConfigs() {
        lineHeight = getSize(of: "Danmu").height
        numberOfLines = Int(floor((bottom - top) / lineHeight))
        
        for _ in 0..<numberOfLines {
            inUsingLines.append(false)
            waitingQueues.append([DSDanmuModel]())
            enteringTimers.append(nil)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(DSDanmuManager.danmuDidEnter(sender:)), name: NSNotification.Name(rawValue: "DSDanmuDidEnter"), object: nil)
        
        self.startTaskTimer()
    }
    
    func startTaskTimer() {
        taskTimer = nil
        taskTimer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(DSDanmuManager.checkInUsingQueue), userInfo: nil, repeats: true)
    }
    
    func stopTaskTimer() {
        if taskTimer.isValid {
            taskTimer.invalidate()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "DSDanmuDidEnter"), object: nil)
    }
    
    func checkInUsingQueue() {
        for i in 0..<self.numberOfLines {
            if !self.inUsingLines[i] {
                if waitingQueues[i].count > 0 {
                    let danmu = waitingQueues[i].removeFirst()
                    self.inUsingLines[i] = true
                    self.shot(with: danmu, at: i+1)
                }
            }
        }
    }
    
    func danmuDidEnter(sender: NSNotification) {
        let userInfo = sender.userInfo as! [String: AnyObject]
        let line = userInfo["line"] as! Int
        self.inUsingLines[line-1] = false
    }
    
    func getSize(of text: String) -> CGSize {
        return (text as NSString).size(attributes: [NSFontAttributeName: self.font])
    }
    
    func add(with text: String, at line: Int ) {
        let danmu = DSDanmuModel(text)
        if inUsingLines[line-1] {
            waitingQueues[line-1].append(danmu)
        } else {
            self.inUsingLines[line-1] = true
            self.shot(with: danmu, at: line)
        }
    }
    
    func shot(with danmu: DSDanmuModel, at line: Int) {
        self.view.addSubview(danmu.danmuView!)
        
        let danmuSize = getSize(of: danmu.text)
        danmu.danmuView!.frame = CGRect(x: self.view.frame.width, y: self.top + self.lineHeight*CGFloat(line-1), width: danmuSize.width, height: danmuSize.height)
        
        let totalDistance = danmuSize.width + self.view.frame.width
        let totalTime = Double(totalDistance / self.speed)
        let enteringTime = Double(danmuSize.width / self.speed)
        
        UIView.animate(withDuration: totalTime, delay: 0, options: [.curveLinear], animations: {
            danmu.danmuView!.center = CGPoint(x: -danmuSize.width/2, y: danmuSize.height/2 + self.top + self.lineHeight*CGFloat(line-1))
        }, completion: { (success) in
            // Danmu didDisappear
            danmu.prepareToDeinit()
        })
        
        enteringTimers[line-1] = Timer.scheduledTimer(withTimeInterval: enteringTime, repeats: false, block: { (timer) in
            // Danmu didEnter
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DSDanmuDidEnter"), object: self, userInfo: ["line": line])
        })
        
    }
    
    func addRandom(with text: String = "This is a test Danmu.", at line: Int = 0) {
        let pos = line == 0 ? Int(arc4random_uniform(UInt32(self.numberOfLines)))+1 : line
        self.add(with: text, at: pos)
    }
    
    
    //
    // Pause / Resume UIView.animation
    // Thanks to t4nhpt from StackOverflow
    // http://stackoverflow.com/questions/33994520/how-to-pause-and-resume-uiview-animatewithduration
    //
    var isPause: Bool = false
    func pause() {
        self.stopTaskTimer()
        
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
        
        self.startTaskTimer()
    }
    
    func togglePause() {
        if isPause {
            self.resume()
        } else {
            self.pause()
        }
        isPause = !isPause
    }
    
    //
    // End of Pause / Resume UIView.animation
    //
}
