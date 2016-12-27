//
//  CustonStickerView.swift
//  Emoji
//
//  Created by Ant on 16/9/15.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit
import Messages

class CustonStickerView: MSStickerView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var imageName: String!
    var shouldHistoryChange = true
    
    let HISTORY_MAX = 30
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if shouldHistoryChange {
            if let data = UserDefaults.standard.array(forKey: "EmojiHistory") {
                
                var emojiHistory = data as! [String]
                
                if emojiHistory.count == HISTORY_MAX {
                    emojiHistory.popLast()
                }
                
                if emojiHistory.contains(imageName) {
                    emojiHistory.remove(at: emojiHistory.index(of: imageName)!)
                }
                emojiHistory.insert(imageName, at: 0)
                
                UserDefaults.standard.set(emojiHistory, forKey: "EmojiHistory")
                if UserDefaults.standard.synchronize() {
                    print("Saved")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HistoryChanged"), object: nil)
                } else {
                    print("Fail")
                }
            } else {
                let emojiHistory: [String] = [imageName]
                UserDefaults.standard.set(emojiHistory, forKey: "EmojiHistory")
                
                if UserDefaults.standard.synchronize() {
                    print("Saved")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HistoryChanged"), object: nil)
                } else {
                    print("Fail")
                }
            }
        }
        
    }

}
