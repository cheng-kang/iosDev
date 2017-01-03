//
//  DanmuMangerTestViewController.swift
//  Danmu
//
//  Created by Ant on 03/01/2017.
//  Copyright © 2017 Lahk. All rights reserved.
//
import UIKit

class DanmuMangerTestViewController: UIViewController {
    var danmuManager: DanmuManager!
    @IBOutlet weak var lbl: UILabel!
    var time: Double = 0.0
    var timer: PauseableTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        danmuManager = DanmuManager(with: self.view, top: 0, bottom: 500, speed: 300)
        
        timer = PauseableTimer(timer: Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(DanmuMangerTestViewController.updateLabel), userInfo: nil, repeats: true))
    }
    
    func updateLabel() {
        self.time += 0.1
        self.lbl.text = "\(self.time)"
    }
    
    @IBAction func randomDanmuBtnClick(sender: UIButton) {
        danmuManager.addRandom()
    }
    @IBAction func randomDanmu100BtnClick(sender: UIButton) {
        for _ in 0..<100 {
            danmuManager.addRandom()
        }
    }
    
    var isPause = false
    @IBAction func togglePauseBtnClick(sender: UIButton) {
        danmuManager.togglePause()
        if isPause {
            timer.resume()
            
            self.isPause = false
        } else {
            timer.pause()
            
            self.isPause = true
        }
    }
}
