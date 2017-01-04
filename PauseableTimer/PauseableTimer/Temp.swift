
//
//  PauseableTimer.swift
//  PauseableTimer
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

// This is a failed attempt.

import Foundation

enum PauseableTimerInitType: Int {
    case timeIntervalWithSelector = 1
    case timeIntervalWithBlock = 2
    case firedateWithSelector = 3
    case firedateWithBlock = 4
}

class PauseableTimer1: NSObject {
    var timer: Timer!
    var startTime: TimeInterval?
    var stopTime: TimeInterval?
    
    private var type: PauseableTimerInitType!
    
    private var _firedate: Date?
    private var _timeInterval: TimeInterval?
    private var _target: Any?
    private var _selector: Selector?
    private var _userInfo: Any?
    private var _repeats: Bool?
    private var _block: ((Timer) -> Swift.Void)?
    
    private(set) var isPause: Bool = false
    
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
        self.type = PauseableTimerInitType.timeIntervalWithSelector
        
        self._timeInterval = ti
        self._target = aTarget
        self._selector = aSelector
        self._userInfo = userInfo
        self._repeats = yesOrNo
        
        self.timer = Timer(timeInterval: ti, target: aTarget, selector: aSelector, userInfo: userInfo, repeats: yesOrNo)
        self.startTime = Date().timeIntervalSinceReferenceDate
        
        RunLoop.current.add(self.timer, forMode: .commonModes)
    }
    
    @available(iOS 10.0, *)
    init(timeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Swift.Void) {
        self.type = PauseableTimerInitType.timeIntervalWithBlock
        
        self._timeInterval = interval
        self._repeats = repeats
        self._block = block
        
        self.timer = Timer.init(timeInterval: interval, repeats: repeats, block: block)
        self.startTime = Date().timeIntervalSinceReferenceDate
        
        RunLoop.current.add(self.timer, forMode: .commonModes)
    }
    
    init(fireAt date: Date, interval ti: TimeInterval, target t: Any, selector s: Selector, userInfo ui: Any?, repeats rep: Bool) {
        self.type = PauseableTimerInitType.firedateWithSelector
        
        self._firedate = date
        self._timeInterval = ti
        self._target = t
        self._selector = s
        self._userInfo = ui
        self._repeats = rep
        
        self.timer = Timer(fireAt: date, interval: ti, target: t, selector: s, userInfo: ui, repeats: rep)
        self.startTime = Date().timeIntervalSinceReferenceDate
        
        RunLoop.current.add(self.timer, forMode: .commonModes)
    }
    
    @available(iOS 10.0, *)
    init(fire date: Date, interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Swift.Void) {
        self.type = PauseableTimerInitType.firedateWithBlock
        
        self._firedate = date
        self._timeInterval = interval
        self._repeats = repeats
        self._block = block
        
        self.timer = Timer(fire: date, interval: interval, repeats: repeats, block: block)
        self.startTime = Date().timeIntervalSinceReferenceDate
        
        RunLoop.current.add(self.timer, forMode: .commonModes)
    }
    
    func invalidate() {
        self.stopTime = NSDate.timeIntervalSinceReferenceDate
        self.timer.invalidate()
        self.resumeTimer?.invalidate()
        self.isPause = false
    }
    
    func pause() {
        if !isPause {
            self.invalidate()
            isPause = true
        }
    }
    
    var lastTimeLeft: TimeInterval?
    var resumeTimer: Timer?
    func resume() {
        if isPause {
            switch self.type! {
            case .timeIntervalWithSelector:
                let timePassed = stopTime! - startTime!
                let timeLeft = self._timeInterval! - timePassed.truncatingRemainder(dividingBy: self._timeInterval!)
                // check if the Timer is expired
                if timeLeft >= 0.08 {
                    // not expired
                    
                    // renew timer
                    self.timer = Timer(timeInterval: self._timeInterval!, target: self._target!, selector: self._selector!, userInfo: self._userInfo, repeats: self._repeats!)
                    // schedule next fire
                    resumeTimer = Timer.scheduledTimer(withTimeInterval: timeLeft, repeats: false, block: { (_) in
                        self.timer.fire()
                        if self._repeats! {
                            RunLoop.current.add(self.timer, forMode: .commonModes)
                        } else {
                            self.timer.invalidate()
                        }
                        self.resumeTimer = nil
                    })
                    lastTimeLeft = timeLeft
                } else {
                    // if self._repeats! && timeLeft == 0 {
                    //     self.timer = Timer(timeInterval: self._timeInterval!, target: self._target!, selector: self._selector!, userInfo: self._userInfo!, repeats: self._repeats!)
                    //     RunLoop.current.add(self.timer, forMode: .commonModes)
                    //     self.timer.fire()
                    // }
                }
            case .timeIntervalWithBlock:
                break
            case .firedateWithSelector:
                break
            case .firedateWithBlock:
                break
            }
            isPause = false
        }
    }
}
