//
//  CheckboxWithLabel.swift
//  Weibo
//
//  Created by Ant on 3/29/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class CheckboxWithLabel: UIStackView {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    var selected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.img.image = UIImage(named: "check_btn_on")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let position = touch!.location(in: self.superview)
        if self.frame.contains(position) {
            if self.selected {
                self.img.image = UIImage(named: "check_btn_false")
            } else {
                self.img.image = UIImage(named: "check_btn_true")
            }
            self.selected = !self.selected
        } else {
            self.img.image = UIImage(named: "check_btn_false")
        }
    }
    
    func initView(_ lbl: String) {
        self.lbl.text = lbl
        self.img.image = UIImage(named: "check_btn_false")
    }

}
