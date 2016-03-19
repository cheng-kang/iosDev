//
//  PostCell.swift
//  Weibo
//
//  Created by Ant on 3/19/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timeAndDeviceLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var onePic: UIImageView!
    @IBOutlet weak var firstPic: UIImageView!
    @IBOutlet weak var secondPic: UIImageView!
    @IBOutlet weak var thirdPic: UIImageView!
    @IBOutlet weak var fourthPic: UIImageView!
    @IBOutlet weak var fifthPic: UIImageView!
    @IBOutlet weak var sixthPic: UIImageView!
    @IBOutlet weak var seventhPic: UIImageView!
    @IBOutlet weak var eighthPic: UIImageView!
    @IBOutlet weak var ninethPic: UIImageView!
    @IBOutlet weak var buttonPanel: ThreeButtonsPanel!
    
    @IBOutlet weak var constraintButtonPanelAndNinePic: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCell() {
        self.avatarImg.image = UIImage(named: "avatar")
        self.usernameLbl.text = "雷森图喵喜客"
        self.timeAndDeviceLbl.text = "3小时前  来自iPhone 5s"
        self.contentLbl.text = "这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！"
        
        self.onePic.image = UIImage(named: "10")
        self.firstPic.image = UIImage(named: "1")
        self.secondPic.image = UIImage(named: "2")
        self.thirdPic.image = UIImage(named: "3")
        self.fourthPic.image = UIImage(named: "4")
        self.fifthPic.image = UIImage(named: "5")
        self.sixthPic.image = UIImage(named: "6")
        self.seventhPic.image = UIImage(named: "7")
        self.eighthPic.image = UIImage(named: "8")
        self.ninethPic.image = UIImage(named: "9")
        
//        self.firstPic.hidden = true
//        self.secondPic.hidden = true
//        self.thirdPic.hidden = true
//        self.fourthPic.hidden = true
//        self.fifthPic.hidden = true
//        self.sixthPic.hidden = true
//        self.seventhPic.hidden = true
//        self.eighthPic.hidden = true
//        self.ninethPic.hidden = true
//        self.constraintButtonPanelAndNinePic.constant = -100
//
//        self.buttonPanel = ThreeButtonsPanel()
//        self.buttonPanel.initPanel()
    }

}
