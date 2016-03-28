//
//  ThreeButtonsPanel.swift
//  Weibo
//
//  Created by Ant on 3/19/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ThreeButtonsPanel: UIView {
    
    
    @IBOutlet weak var firstButtonView: LabelAndImageButton!
    @IBOutlet weak var secondeButtonView: LabelAndImageButton!
    @IBOutlet weak var thirdButtonView: LabelAndImageButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowOffset = CGSizeMake(0, 0.5); //default is (0.0, -3.0)
        self.layer.shadowColor = UIColor.lightGrayColor().CGColor; //default is black
        self.layer.shadowRadius = 0.5; //default is 3.0
        self.layer.shadowOpacity = 1; //default is 0.0
        
        self.layer.borderColor = COLOR_LIGHT_GREY.CGColor
        self.layer.borderWidth = 1
        
    }
    
    func initPanel() {
        self.firstButtonView.initView("forward", label: "转发")
        self.secondeButtonView.initView("bubble", label: "评论")
        self.thirdButtonView.initView("heart", label: "赞")
    }

}
