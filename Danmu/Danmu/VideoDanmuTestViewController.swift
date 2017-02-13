//
//  VideoDanmuTestViewController.swift
//  Danmu
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoDanmuTestViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    var time: Double = 0.0
    var vdm: VideoDanmuManager!
    var player: AVPlayer!
    var timer: PauseableTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "test", ofType:"m4v") else {
            debugPrint("test.m4v not found")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 200)
        self.view.layer.addSublayer(playerLayer)
        player.play()
        
        
        vdm = VideoDanmuManager(view: self.view,
                                videoLength: 10,
                                danmuData: [
                                    (3.4, "3.4 Wowowowowowow!"),
                                    (3.4, "3.4 SOOOO COOOOOOOOOOL!"),
                                    (3.4, "3.4 Amazing!!!!"),
                                    (3.4, "3.4 I love you~"),
                                    (3.4, "3.4 MY BABY!!!!"),
                                    (1.1, "1.1 This is a test Danmu!!!"),
                                    (2.0, "2.0 Another test Danmu."),
                                    (4.1, "4.1 Amazing!!!!"),
                                    (6.1, "6.1 Test!!!!"),
                                    (8.1, "8.1 Test!!!!"),
                                    (9.1, "9.1 Test!!!!"),
                                    (10, "10 Test!!!!"),
            ],
                                isSorted: false
        )
        
        vdm.isEndCallback = {
            self.timer.invalidate()
        }
        
        vdm.start()
    }
    
    func updateLabel() {
        self.time += 0.1
        self.lbl.text = "\(self.time)"
    }
    
    @IBAction func startBtnClick(sender: UIButton) {
        playVideo()
        
        timer = PauseableTimer(timer: Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(VideoDanmuTestViewController.updateLabel), userInfo: nil, repeats: true))
    }
    
    @IBAction func randomDanmuBtnClick(sender: UIButton) {
        vdm.danmuManager.addRandom()
    }
    @IBAction func randomDanmu100BtnClick(sender: UIButton) {
        for _ in 0..<100 {
            vdm.danmuManager.addRandom()
        }
    }
    
    var isPause = false
    @IBAction func togglePauseBtnClick(sender: UIButton) {
        // DSDM.togglePause()
        vdm.toggle()
        if isPause {
            player.play()
            timer.resume()
            
            self.isPause = false
        } else {
            player.pause()
            timer.pause()
            
            self.isPause = true
        }
    }
    
    @IBAction func restart(sender: UIButton) {
        self.time = 0
        player.play()
        vdm.restart()
    }
}
