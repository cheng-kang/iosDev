//
//  ViewController.swift
//  PauseableTimer
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    
    var timerNeverStop: Timer!
    var timerWillPause: PauseableTimer!
    var time: Double = 0
    
    var time1: Double = 0
    var time2: Double = 0
    var time3: Double = 0
    
    @IBAction func startBtnClick() {
        //timerWillPause = PauseableTimer1(timeInterval: 1, target: self, selector: #selector(ViewController.test), userInfo: nil, repeats: true)
        timerWillPause = PauseableTimer(timer: Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.test), userInfo: nil, repeats: true))
        self.textview.text = self.textview.text+"Start at: \(Date())\n\(Date().timeIntervalSinceReferenceDate)\ntime = \(self.time)"
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            self.time1 += 0.1
            self.lbl1.text = "\(self.time1)"
        })
        Timer.scheduledTimer(withTimeInterval: 0.048, repeats: true, block: { timer in
            self.time2 += 0.048
            self.lbl2.text = "\(self.time2)"
        })
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { timer in
            self.time3 += 0.05
            self.lbl3.text = "\(self.time3)"
        })
    }
    
    @IBAction func pauseBtnClick() {
        timerWillPause.pause()
        self.textview.text = self.textview.text+"\nPause at: \(Date())\n\(Date().timeIntervalSinceReferenceDate)\ntime = \(self.time)"
    }
    
    @IBAction func resumeBtnClick() {
        timerWillPause.resume()
        self.textview.text = self.textview.text+"\nResume at: \(Date())\n\(Date().timeIntervalSinceReferenceDate)\ntime = \(self.time)"
    }
    
    func test() {
        self.time += 1
        self.textview.text = self.textview.text+"Triger at: \(Date())\n\(Date().timeIntervalSinceReferenceDate)\ntime = \(self.time)"
    }
    
    fileprivate var thingWatchingRunLoop = RunLoop.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func testTimers() {
        
        print(Date())
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timer1(timer:)), userInfo: nil, repeats: true)
        var timer2: Timer? = nil
        timer2 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            print("🌻Timer2")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
            print(timer2)
            timer2 = nil
            print(timer2)
        })
        timer2?.fire()
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
        print(timer4.isValid)
        
        let timer5 = Timer(timeInterval: 1, repeats: true, block: { timer in
            print("🔥Timer5")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        
        // Timer that manually fired and not added to RunLoop
        let timer6 = Timer(timeInterval: 1, repeats: true, block: { timer in
            print("🔥Timer6")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        timer6.fire() // Result: Fire once
        print("timer6 fire")
        
        let timer7 = Timer(fire: Date().addingTimeInterval(TimeInterval(3)), interval: 1, repeats: false, block: { timer in
            print("☂️Timer7")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
            timer.invalidate()
            print(timer.isValid)
            timer.invalidate()
            print(timer.isValid)
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
        
        let timer9 = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
            print("💦Timer9")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
            //timer.invalidate()
            //print("Incalidated")
            //print(timer.isValid)
            //print("Fire")
            //timer.fire()
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { (t) in
                
                print("timer9 after 0.1 sec")
                print(timer.isValid)
                print(timer.fireDate)
            })
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (t) in
                
                print("timer9 after 1 sec")
                print(timer.isValid)
                print(timer.fireDate)
            })
        })
        
        // Timer that has a expired firedate
        let timer10 = Timer(fire: Date().addingTimeInterval(TimeInterval(-5)), interval: 1, repeats: false, block: { (timer) in
            print("💦Timer10")
            print(Date())
            print(timer.fireDate)
            print(timer.isValid)
            print(timer.timeInterval)
            print(timer.tolerance)
        })
        thingWatchingRunLoop.add(timer10, forMode: .commonModes)
        print(Date())
        print("timer10 added to runloop")
        
        let timer11 = Timer(timeInterval: 1, repeats: true, block: { timer in
            print("💦Timer11")
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
            timer2?.invalidate()
            print(Date())
            print("timer2 invalidated")
            
            print("timer6 info:")
            print(timer6.isValid)
            print(timer6.fireDate)
            
            print("timer9 info:")
            print(timer9.isValid)
            print(timer9.fireDate)
            
            print("timer10 info:")
            print(timer10.isValid)
            print(timer10.fireDate)
        })
    }
    
    func timer1(timer: Timer) {
        print("🌺Timer1")
        print(Date())
        print(timer.fireDate)
        print(timer.isValid)
        print(timer.timeInterval)
        print(timer.tolerance)
    }


}

