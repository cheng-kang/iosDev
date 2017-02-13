//
//  PauseableTimer.swift
//  PauseableTimer
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import Foundation

class PauseableTimer: NSObject {
    var timer: Timer!
    private(set) var isPause: Bool = false
    private(set) var timeLeft: TimeInterval?
    
    init(timer aTimer: Timer) {
        self.timer = aTimer
    }
    
    deinit {
        print("⏰ Pauseable Timer Deinit")
    }
    
    func pause() {
        if !isPause {
            timeLeft = self.timer.fireDate.timeIntervalSinceNow
            
            // 此处受到 _超 文章启发
            // [NSTimer 总结1(包括计时器不准的解决)](http://www.jianshu.com/p/e554a164d0da)
            self.timer.fireDate = Date(timeIntervalSinceNow: 3600*10000)
            
            isPause = true
        }
    }
    
    func resume() {
        if isPause {
            self.timer.fireDate = Date().addingTimeInterval(timeLeft!)
            isPause = false
        }
    }
    
    func invalidate() {
        self.timer.invalidate()
    }
}
