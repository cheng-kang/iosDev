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
    var startTime: TimeInterval?
    var stopTime: TimeInterval?
    
    private var type: Int!
    
    private var _firedate: Date?
    private var _timeInterval: TimeInterval?
    private var _target: Any?
    private var _selector: Selector?
    private var _userInfo: Any?
    private var _repeats: Bool?
    private var _block: ((Timer) -> Swift.Void)?

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
    
    init(timeInterval ti: TimeInterval, target aTarget: Any, selector aSelector: Selector, userInfo: Any?, repeats yesOrNo: Bool) {
        self.type = 1
        
        self._timeInterval = ti
        self._target = aTarget
        self._selector = aSelector
        self._userInfo = userInfo
        self._repeats = yesOrNo
        
        self.timer = Timer(timeInterval: ti, target: aTarget, selector: aSelector, userInfo: userInfo, repeats: yesOrNo)
        
        RunLoop.current.add(self.timer, forMode: .commonModes)
    }
    
    @available(iOS 10.0, *)
    init(timeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Swift.Void) {
        self.type = 2
        
        self._timeInterval = interval
        self._repeats = repeats
        self._block = block
        
        self.timer = Timer.init(timeInterval: interval, repeats: repeats, block: block)
        
        RunLoop.current.add(self.timer, forMode: .commonModes)
    }
    
    @available(iOS 10.0, *)
    init(fire date: Date, interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Swift.Void) {
        self.type = 3
        
        self._firedate = date
        self._timeInterval = interval
        self._repeats = repeats
        self._block = block
        
        self.timer = Timer(fire: date, interval: interval, repeats: repeats, block: block)
        
        RunLoop.current.add(self.timer, forMode: .commonModes)
        
    }
    
    
    init(fireAt date: Date, interval ti: TimeInterval, target t: Any, selector s: Selector, userInfo ui: Any?, repeats rep: Bool) {
        self.type = 4
        
        self._firedate = date
        self._timeInterval = ti
        self._target = t
        self._selector = s
        self._userInfo = ui
        self._repeats = rep
        
        self.timer = Timer(fireAt: date, interval: ti, target: t, selector: s, userInfo: ui, repeats: rep)
        
        RunLoop.current.add(self.timer, forMode: .commonModes)
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
