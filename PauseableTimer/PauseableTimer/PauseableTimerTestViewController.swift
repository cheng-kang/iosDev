//
//  PauseableTimerTestViewController.swift.swift
//  PauseableTimer
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import UIKit

class PauseableTimerTestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    var pauseableTimer: PauseableTimer!
    
    @IBOutlet weak var tv: UITextView!
    @IBAction func start() {
        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { timer in
            self.tv.text = self.tv.text + "\n   Timer fire at \(Date())\n"
        })
        pauseableTimer = PauseableTimer(timer: timer)
        self.tv.text = "Pauseable Timer initialized with scheduled Timer: \n    withTimeInterval: 3\n    repeats: true\n"
        self.tv.text = self.tv.text + "\nTimer scheduled at \(Date())\n"
    }
    @IBAction func toggle() {
        if pauseableTimer.isPause {
            self.tv.text = self.tv.text + "\nResume at \(Date())\ntimeLeft: \(pauseableTimer.timeLeft)\n"
            pauseableTimer.resume()
        } else {
            self.tv.text = self.tv.text + "\nPause at \(Date())\n"
            pauseableTimer.pause()
        }
    }
    
}

