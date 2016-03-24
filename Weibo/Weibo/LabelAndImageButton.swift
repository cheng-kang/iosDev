//
//  LabelAndImageButton.swift
//  Weibo
//
//  Created by Ant on 3/24/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class LabelAndImageButton: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.backgroundColor = LIGHT_GREY_COLOR
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //        performSegueWithIdentifier("IDENTIFIER", sender: A_SENDER)
        self.backgroundColor = UIColor.whiteColor()
    }
    
}
