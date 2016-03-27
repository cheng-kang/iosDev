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
    
    @IBOutlet weak var buttonPanelAndContentLbl: NSLayoutConstraint!
    
    @IBOutlet weak var buttonPanelAndFirstPicConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var buttonPanelAndFourthPicConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var buttonPanelAndSeventhPicConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var buttonPanelAndOnePicConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var onePicHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var onePicTop: NSLayoutConstraint!
    @IBOutlet weak var onePicLeft: NSLayoutConstraint!
    
    @IBOutlet weak var firstPicLeft: NSLayoutConstraint!
    @IBOutlet weak var firstPicTop: NSLayoutConstraint!
    @IBOutlet weak var secondPicTop: NSLayoutConstraint!
    @IBOutlet weak var secondPicLeft: NSLayoutConstraint!
    @IBOutlet weak var thirdPicLeft: NSLayoutConstraint!
    @IBOutlet weak var thirdPicTop: NSLayoutConstraint!
    @IBOutlet weak var fourthPicLeft: NSLayoutConstraint!
    @IBOutlet weak var fourthPicTop: NSLayoutConstraint!
    @IBOutlet weak var fifthPicTop: NSLayoutConstraint!
    @IBOutlet weak var fifthPicLeft: NSLayoutConstraint!
    @IBOutlet weak var sixthPicLeft: NSLayoutConstraint!
    @IBOutlet weak var sixthPicTop: NSLayoutConstraint!
    @IBOutlet weak var seventhPicLeft: NSLayoutConstraint!
    @IBOutlet weak var seventhPicTop: NSLayoutConstraint!
    @IBOutlet weak var eighthPicLeft: NSLayoutConstraint!
    @IBOutlet weak var eighthPicTop: NSLayoutConstraint!
    @IBOutlet weak var ninethPicTop: NSLayoutConstraint!
    @IBOutlet weak var ninethPicLeft: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCell(which: Int) {
        self.avatarImg.image = UIImage(named: "avatar")
        self.usernameLbl.text = "雷森图喵喜客"
        self.timeAndDeviceLbl.text = "3小时前  来自iPhone 5s"
        self.contentLbl.text = "这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！"
//        self.contentLbl.text = "这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博！！！这是一条测试用的微博"
        
        self.onePic.image = UIImage(named: "test")
        self.firstPic.image = UIImage(named: "1")
        self.secondPic.image = UIImage(named: "2")
        self.thirdPic.image = UIImage(named: "3")
        self.fourthPic.image = UIImage(named: "4")
        self.fifthPic.image = UIImage(named: "5")
        self.sixthPic.image = UIImage(named: "6")
        self.seventhPic.image = UIImage(named: "7")
        self.eighthPic.image = UIImage(named: "8")
        self.ninethPic.image = UIImage(named: "9")
        
        if which > 1 {
            //        self.onePic.hidden = true
            self.onePic.hidden = true
            
            self.firstPic.hidden = true
            self.secondPic.hidden = true
            self.thirdPic.hidden = true
            self.fourthPic.hidden = true
            self.fifthPic.hidden = true
            self.sixthPic.hidden = true
            self.seventhPic.hidden = true
            self.eighthPic.hidden = true
            self.ninethPic.hidden = true
            
        } else {
            self.onePic.hidden = true
            
            self.firstPic.hidden = false
            self.secondPic.hidden = false
            self.thirdPic.hidden = false
            self.fourthPic.hidden = false
            self.fifthPic.hidden = false
            self.sixthPic.hidden = false
            self.seventhPic.hidden = false
            self.eighthPic.hidden = true
            self.ninethPic.hidden = true
            
        }
        
        self.buttonPanelAndOnePicConstraint.priority = !self.onePic.hidden ? 750 : 250
        self.buttonPanelAndFirstPicConstraint.priority = !self.firstPic.hidden && self.fourthPic.hidden && self.seventhPic.hidden ? 750 : 250
        self.buttonPanelAndFourthPicConstraint.priority = !self.fourthPic.hidden && self.seventhPic.hidden ? 750 : 250
        self.buttonPanelAndSeventhPicConstraint.priority = !self.seventhPic.hidden ? 750 : 250
        self.buttonPanelAndContentLbl.priority = firstPic.hidden && onePic.hidden ? 750 : 250
        
        if onePic.hidden {
            onePicTop.active = false
            onePicLeft.active = false
            buttonPanelAndOnePicConstraint.active = false
        } else {
            onePicTop.active = true
            onePicLeft.active = true
            buttonPanelAndOnePicConstraint.active = true
        }
        
        if seventhPic.hidden {
            seventhPicLeft.active = false
            seventhPicTop.active = false
            eighthPicLeft.active = false
            eighthPicTop.active = false
            ninethPicLeft.active = false
            ninethPicTop.active = false
            buttonPanelAndSeventhPicConstraint.active = false
        } else {
            seventhPicLeft.active = true
            seventhPicTop.active = true
            eighthPicLeft.active = true
            eighthPicTop.active = true
            ninethPicLeft.active = true
            ninethPicTop.active = true
            buttonPanelAndSeventhPicConstraint.active = true
        }
        
        if fourthPic.hidden {
            fourthPicTop.active = false
            fourthPicLeft.active = false
            fifthPicTop.active = false
            fifthPicLeft.active = false
            sixthPicTop.active = false
            sixthPicLeft.active = false
            buttonPanelAndFourthPicConstraint.active = false
        } else {
            fourthPicTop.active = true
            fourthPicLeft.active = true
            fifthPicTop.active = true
            fifthPicLeft.active = true
            sixthPicTop.active = true
            sixthPicLeft.active = true
            buttonPanelAndFourthPicConstraint.active = true
        }
        
        if firstPic.hidden {
            firstPicTop.active = false
            firstPicLeft.active = false
            secondPicTop.active = false
            secondPicLeft.active = false
            thirdPicTop.active = false
            thirdPicLeft.active = false
            buttonPanelAndFirstPicConstraint.active = false
        } else {
            firstPicTop.active = true
            firstPicLeft.active = true
            secondPicTop.active = true
            secondPicLeft.active = true
            thirdPicTop.active = true
            thirdPicLeft.active = true
            buttonPanelAndFirstPicConstraint.active = true
        }
        
        print(which)
        print(buttonPanelAndFirstPicConstraint.priority)
        print(buttonPanelAndFourthPicConstraint.priority)
        print(buttonPanelAndSeventhPicConstraint.priority)
        print(buttonPanelAndOnePicConstraint.priority)
        print(buttonPanelAndContentLbl.priority)
        
        if self.buttonPanel != nil {
            self.buttonPanel.initPanel()
        }
    }

}
