//
//  VideoDanmuManager.swift
//  Danmu
//
//  Created by Ant on 29/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import UIKit

class VideoDanmuManager: NSObject {
    private weak var view: UIView!
    private var timer: Timer?
    private(set) var videoLength: Double!
    private(set) var videoCurrent: Double = 0
    private(set) var videoStartAt: Double = 0
    private var currentDanmuIndex: Int = 0
    
    var danmuManager: DanmuManager!
    
    private var danmuData: [(Double, String)] = [(Double, String)]()
    
    var isEndCallback: (()->())?
    
    init(view: UIView, videoLength: Double, videoCurrent: Double = 0, danmuData: [(Double, String)], isSorted: Bool = true, top: CGFloat = 0, bottom: CGFloat = 0) {
        self.view = view
        self.videoLength = videoLength
        self.videoCurrent = videoCurrent
        self.danmuData.append(contentsOf: danmuData)
        
        self.danmuManager = DanmuManager(with: self.view, top: top, bottom: bottom)
        
        super.init()
        if !isSorted {
            self.sort()
        }
    }
    
    private func sort() {
        self.danmuData = self.danmuData.sorted(by: { $0.0 < $1.0 })
    }
    
    var isStart: Bool = false
    var isPause: Bool = false
    var isEnd: Bool = false
    
    func start() {
        if !isStart {
            self.isStart = true
            self.isEnd = false
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.counter), userInfo: nil, repeats: true)
        }
    }
    
    func toggle() {
        if isPause {
            self.resume()
        } else {
            self.pause()
        }
    }
    
    func pause() {
        if !self.isPause {
            self.isPause = true
            self.timer?.invalidate()
            
            self.danmuManager.pause()
        }
    }
    
    func resume() {
        if self.isPause {
            self.isPause = false
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.counter), userInfo: nil, repeats: true)
            
            self.danmuManager.resume()
        }
    }
    
    func stop() {
        if !self.isEnd {
            self.timer?.invalidate()
            self.timer = nil
            self.isEnd = true
            self.isStart = false
        }
    }
    
    func restart(at videoCurrent: Double = 0) {
        self.isStart = true
        self.isEnd = false
        self.videoCurrent = videoCurrent
        self.currentDanmuIndex = 0
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.counter), userInfo: nil, repeats: true)
    }
    
    private func counter() {
        self.videoCurrent += 0.1
        if self.videoCurrent >= self.videoLength {
            if self.timer!.isValid {
                self.timer?.invalidate()
                self.isEnd = true
                self.isEndCallback?()
            }
        } else {
            if danmuData.count > 0 {
                let index = currentDanmuIndex
                for i in index..<danmuData.count {
                    let (at, text) = self.danmuData[i]
                    if i == danmuData.count {
                        self.currentDanmuIndex = -1
                    }
                    if at >= self.videoCurrent && at < self.videoCurrent + 0.1 {
                        self.danmuManager.addRandom(with: text)
                    } else if at > self.videoCurrent + 0.1 {
                        self.currentDanmuIndex = i
                        break
                    } else {
                        continue
                    }
                }
            }
        }
    }
}
