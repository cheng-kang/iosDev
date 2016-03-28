//
//  LabelAndImageButton.swift
//  Weibo
//
//  Created by Ant on 3/24/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class LabelAndImageButton: UIView {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.backgroundColor = COLOR_LIGHT_GREY
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //        performSegueWithIdentifier("IDENTIFIER", sender: A_SENDER)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    func initView(image: String, label: String) {
        img.image = UIImage(named: image)
        lbl.text = label
    }
}
