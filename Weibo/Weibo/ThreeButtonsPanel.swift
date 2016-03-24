//
//  ThreeButtonsPanel.swift
//  Weibo
//
//  Created by Ant on 3/19/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ThreeButtonsPanel: UIView {
    
    @IBOutlet weak var firstButtonView: UIView!
    @IBOutlet weak var secondButtonView: UIView!
    @IBOutlet weak var thirdButtonView: UIView!
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var thirdImg: UIImageView!
    @IBOutlet weak var thirdLbl: UILabel!
    
    override func awakeFromNib() {
        self.layer.shadowOffset = CGSizeMake(0, 1); //default is (0.0, -3.0)
        self.layer.shadowColor = UIColor.lightGrayColor().CGColor; //default is black
        self.layer.shadowRadius = 1.0; //default is 3.0
        self.layer.shadowOpacity = 1; //default is 0.0
        
    }
    
    func initPanel() {
        self.firstImg.image = UIImage(named: "forward")
        self.firstLbl.text = "转发"
        self.secondImg.image = UIImage(named: "bubble")
        self.secondLbl.text = "评论"
        self.thirdImg.image = UIImage(named: "heart")
        self.thirdLbl.text = "点赞"
    }

}
