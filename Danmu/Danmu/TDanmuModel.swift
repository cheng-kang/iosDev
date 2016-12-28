//
//  TDanmuModel.swift
//  Danmu
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import Foundation
import UIKit

class TDanmuModel: NSObject {
    var danmuView: UILabel? = UILabel()
    
    private var defaultFont: UIFont = UIFont.systemFont(ofSize: 24)
    private var customFont: UIFont?
    var font: UIFont {
        return customFont == nil ? defaultFont : customFont!
    }
    
    private(set) var text: String = ""
    private var textColor: UIColor?
    private var bgColor: UIColor?
    
    private(set) var topY: CGFloat!
    private(set) var size: CGSize!
    
    private var nextDanmu:TDanmuModel?
    private(set) var precedingDanmuCount: Int = 0
    
    var shot: (()->())?
    
    init(_ text: String, at topY: CGFloat) {
        self.text = text
        self.topY = topY
        
        super.init()
        self.afterInit()
    }
    
    init(_ text: String, at topY: CGFloat, with font: UIFont) {
        self.customFont = font
        
        self.text = text
        self.topY = topY
        
        super.init()
        self.afterInit()
    }
    
    init(_ text: String, at topY: CGFloat, with font: UIFont?, _ textColor: UIColor?, _ bgColor: UIColor?) {
        self.customFont = font
        self.textColor = textColor
        self.bgColor = bgColor
        
        self.text = text
        self.topY = topY
        
        super.init()
        self.afterInit()
    }
    
    func afterInit() {
        self.size = (self.text as NSString).size(attributes: [NSFontAttributeName: self.font])
        self.danmuView?.text = self.text
        self.danmuView?.font = self.font
    }
    
    func setNextDanmu(_ danmu:TDanmuModel) {
        if self.nextDanmu != nil {
            self.nextDanmu?.setNextDanmu(danmu)
            
            print("---------------")
            print("Queue at Last")
            print(self.nextDanmu!.text)
            print("---------------")
        } else {
            // BUG!!!
            // for unknown reason, sometimes it sets
            // the Danmu itself to its nextDanmu.
            if danmu != self {
                self.nextDanmu = danmu
                
                print("---------------")
                print("Next Danmu Set")
                print(self.nextDanmu!.text)
                print("---------------")
            }
            
        }
    }
    
    func getNextDanmuList(appendTo list: [TDanmuModel] = [TDanmuModel]()) -> [TDanmuModel] {
        var tempList = [TDanmuModel]()
        tempList.append(contentsOf: list)
        tempList.append(self)
        if self.nextDanmu != nil {
            return self.nextDanmu!.getNextDanmuList(appendTo: tempList)
        } else {
            return tempList
        }
    }
    
    func getOccupiedRange() -> (CGFloat, CGFloat) {
        let itemTopY: CGFloat = self.topY
        let itemBottomY: CGFloat = self.topY + self.size.height
        return (itemTopY, itemBottomY)
    }
    
    func notifyNextDanmu() {
        self.nextDanmu?.updatePrecedingDanmuCount(-1)
        self.nextDanmu = nil
    }
    
    func prepareToDeinit() {
        self.danmuView!.removeFromSuperview()
        self.danmuView = nil
        
        self.shot = nil
    }
    
    func updatePrecedingDanmuCount(_ count: Int) {
        self.precedingDanmuCount += count
        
        print("---------------")
        print("Preceding Danmu Count Updated")
        print(self.precedingDanmuCount)
        print("---------------")
        
        if self.precedingDanmuCount == 0 {
            self.shot!()
        }
    }
}
