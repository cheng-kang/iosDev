//
//  DSDanmuModel.swift
//  Danmu
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import Foundation
import UIKit

class DSDanmuModel: NSObject {
    var danmuView: UILabel? = UILabel()
    
    private(set) var text: String = ""
    private var textColor: UIColor?
    private var bgColor: UIColor?
    
    init(_ text: String) {
        self.text = text
        
        super.init()
        self.afterInit()
    }
    
    init(_ text: String, at topY: CGFloat) {
        self.text = text
        
        super.init()
        self.afterInit()
    }
    
    init(_ text: String, at topY: CGFloat, with textColor: UIColor?, _ bgColor: UIColor?) {
        self.textColor = textColor
        self.bgColor = bgColor
        
        self.text = text
        
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
}
