//
//  Temp.swift
//  PauseableTimer
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import Foundation

class Temp: NSObject {
    var timer: Timer!
    var startTime: TimeInterval!
    var stopTime: TimeInterval!
    
    var isValid: Bool {
        return self.timer.isValid
    }
    
    var timeInterval: TimeInterval {
        return self.timer.timeInterval
    }
    
    var fireDate: Date {
        return self.timer.fireDate
    }
    
    @available(iOS 7.0, *)
    var tolerance: TimeInterval {
        return self.timer.tolerance
    }
    
    init(timer aTimer: Timer) {
        self.startTime = NSDate.timeIntervalSinceReferenceDate
        self.timer = aTimer
    }
    
    func invalidate() {
        self.stopTime = NSDate.timeIntervalSinceReferenceDate
        self.timer.invalidate()
    }
    
    func pause() {
        self.invalidate()
    }
    
    func resume() {
        let timeInterval = self.timer.timeInterval
        let fireDate = self.timer.fireDate
    }
}
