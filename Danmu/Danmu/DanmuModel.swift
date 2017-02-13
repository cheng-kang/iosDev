//
//  DanmuModel.swift
//  Danmu
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import UIKit

class DanmuModel: NSObject {
    var danmuView: UILabel? = UILabel()
    
    private(set) var text: String = ""
    private(set) var textColor: UIColor?
    private(set) var bgColor: UIColor?
    
    private(set) var hasBorder: Bool = false
    private(set) var isAdvanced: Bool = false
    
    init(text: String, hasBorder: Bool = false, isAdvanced: Bool = false) {
        self.hasBorder = hasBorder
        self.isAdvanced = isAdvanced
        self.text = text
        
        super.init()
        self.afterInit()
    }
    
    private func afterInit() {
        self.danmuView?.textAlignment = .center
        if hasBorder {
            self.danmuView?.layer.borderColor = UIColor.black.cgColor
            self.danmuView?.layer.borderWidth = 1
        }
        
        if isAdvanced {
            // tc: text color
            if let af = getAdvancedFeature(fromText: self.text, withTag: "tc") {
                self.textColor = getUIColor(withColorHexString: af)
                self.danmuView!.textColor = textColor
                
            }
            // bc: background color
            if let af = getAdvancedFeature(fromText: self.text, withTag: "bc") {
                self.bgColor = getUIColor(withColorHexString: af)
                self.danmuView!.backgroundColor = bgColor
            }
            self.text = self.text.components(separatedBy: ":af:")[0]
        }
        
        self.danmuView?.text = self.text
    }
    
    deinit {
        print("\(self.text) deinit")
    }
    
    func prepareToDeinit() {
        self.danmuView!.removeFromSuperview()
        self.danmuView = nil
    }
    
    private func getAdvancedFeature(fromText text: String, withTag tag: String) -> String? {
        let splitedStr = text.components(separatedBy: "<\(tag)>")
        if splitedStr.count >= 3 {
            return splitedStr[1]
        } else {
            return nil
        }
    }
    
    private func getUIColor(withColorHexString str: String) -> UIColor {
        if str.characters.count != 6 && str.characters.count != 7 {
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
