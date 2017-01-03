//
//  DanmuModel.swift
//  Danmu
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import Foundation
import UIKit

class DanmuModel: NSObject {
    var danmuView: UILabel? = UILabel()
    
    private(set) var text: String = ""
    private(set) var textColor: UIColor? {
        didSet {
            if textColor != nil {
                self.danmuView?.textColor = textColor
            }
        }
    }
    private(set) var bgColor: UIColor? {
        didSet {
            if bgColor != nil {
                self.danmuView?.backgroundColor = bgColor
            }
        }
    }
    private(set) var isAdvanced: Bool = false {
        didSet {
            if isAdvanced {
                // tc: text color
                if let af = getAdvancedFeature(fromText: self.text, withTag: "tc") {
                    self.textColor = getUIColor(withColorHexString: af)
                }
                // bc: background color
                if let af = getAdvancedFeature(fromText: self.text, withTag: "bc") {
                    self.textColor = getUIColor(withColorHexString: af)
                }
            }
        }
    }
    
    init(text: String, isAdvanced: Bool = false) {
        self.isAdvanced = isAdvanced
        self.text = text
        self.danmuView?.layer.borderColor = UIColor.black.cgColor
        
        super.init()
        self.afterInit()
    }
    
    func afterInit() {
        self.danmuView?.text = self.text
    }
    
    func prepareToDeinit() {
        self.danmuView!.removeFromSuperview()
        self.danmuView = nil
    }
    
    func getAdvancedFeature(fromText text: String, withTag tag: String) -> String? {
        let splitedStr = text.components(separatedBy: "<\(tag)>")
        if splitedStr.count >= 3 {
            return splitedStr[1]
        } else {
            return nil
        }
    }
    
    func getUIColor(withColorHexString str: String) -> UIColor {
        if str.characters.count != 6 || str.characters.count != 7 {
            return UIColor.black
        }
        
        let r = UInt8(str.substring(to: str.index(str.startIndex, offsetBy: 2)), radix: 16)
        let g = UInt8(str.substring(with: str.index(str.startIndex, offsetBy: 2)..<str.index(str.startIndex, offsetBy: 4)), radix: 16)
        let b = UInt8(str.substring(with: str.index(str.startIndex, offsetBy: 4)..<str.index(str.startIndex, offsetBy: 6)), radix: 16)
        if r==nil || g==nil || b==nil {
            return UIColor.black
        }
        
        var alpha: CGFloat = 1
        if str.characters.count == 7 {
            let alphaInt = UInt8(str.substring(from: str.index(str.startIndex, offsetBy: 6)), radix: 16)
            if let ai = alphaInt {
                alpha = CGFloat(ai / 10)
            }
        }
        
        return UIColor(red:  CGFloat(r!)/255, green: CGFloat(g!)/255, blue: CGFloat(b!)/255, alpha: alpha)
    }
}
