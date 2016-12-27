//
//  EmojiSizeSettingCell.swift
//  Emoji
//
//  Created by Ant on 16/9/16.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class EmojiSizeSettingCell: UICollectionViewCell {
    
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var substractBtn: UIButton!
    
    let MAX = 60
    let MIN = 10
    let CHANGE = 10
    
    var size: Int {
        set {
            UserDefaults.standard.set(size, forKey: "EmojiSize")
            
            if UserDefaults.standard.synchronize() {
                print("Saved")
                sizeLbl.text = "\(size)"
            } else {
                fatalError("Unable to set Emoji Size")
            }
        }
        
        get {
            return Int(sizeLbl.text!)!
        }
    }
    
    @IBAction func plus(_ sender: UIButton) {
        var size = Int(sizeLbl.text!)!
        if size <= MAX - CHANGE {
            size += CHANGE
            sizeLbl.text = "\(size)"
            saveChange(size: size)
        }
        
        if size == MAX {
            plusBtn.isEnabled = false
        } else {
            plusBtn.isEnabled = true
        }
    }
    @IBAction func substract(_ sender: UIButton) {
        var size = Int(sizeLbl.text!)!
        if size >= MIN + CHANGE {
            size -= CHANGE
            sizeLbl.text = "\(size)"
            saveChange(size: size)
        }
        
        if size == MIN {
            substractBtn.isEnabled = false
        } else {
            substractBtn.isEnabled = true
        }
    }
    
    func saveChange(size: Int) {
        
        UserDefaults.standard.set(size, forKey: "EmojiSize")
        
        if UserDefaults.standard.synchronize() {
            print("Saved")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "EmojiSizeChanged"), object: nil)
        } else {
            fatalError("Unable to set Emoji Size")
        }
    }
}
