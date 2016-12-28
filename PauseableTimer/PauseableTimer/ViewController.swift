//
//  ViewController.swift
//  PauseableTimer
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var thingWatchingRunLoop = RunLoop.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(Date())
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timer1(timer:)), userInfo: nil, repeats: true)
        let timer2 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            print("🌻Timer2")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        timer2.fire()
        print("timer2 fire")
        
        let timer3 = Timer(fire: Date() , interval: 1, repeats: true, block: { timer in
            print("🍄Timer3")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        thingWatchingRunLoop.add(timer3, forMode: .commonModes)
        print(Date())
        print("timer3 added to runloop")
        
        let timer4 = Timer(fire: Date() , interval: 1, repeats: true, block: { timer in
            print("🌚Timer4")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        timer4.fire()
        print("timer4 fire")
        print(timer4 == nil)
        
        let timer5 = Timer(timeInterval: 1, repeats: true, block: { timer in
            print("🔥Timer5")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        
        let timer6 = Timer(timeInterval: 1, repeats: true, block: { timer in
            print("🔥Timer6")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        timer6.fire()
        print("timer6 fire")
        
        let timer7 = Timer(fire: Date().addingTimeInterval(TimeInterval(3)), interval: 1, repeats: false, block: { timer in
            print("☂️Timer7")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        thingWatchingRunLoop.add(timer7, forMode: .commonModes)
        print(Date())
        print("timer7 added to runloop")
        
        let timer8 = Timer(fire: Date().addingTimeInterval(TimeInterval(3)), interval: 1, repeats: false, block: { timer in
            print("🌊Timer8")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { _ in
            self.thingWatchingRunLoop.add(timer8, forMode: .commonModes)
            print(Date())
            print("timer8 added to runloop")
            timer2.invalidate()
            print(Date())
            print("timer2 invalidated")
        })
    }
    
    func timer1(timer: Timer) {
        print("🌺💦Timer1")
        print(Date())
        print(timer.fireDate)
        print(timer.isValid)
        print(timer.timeInterval)
        print(timer.tolerance)
    }


}

