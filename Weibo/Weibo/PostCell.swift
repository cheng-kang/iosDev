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
    
    func initCell(_ which: Int) {
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
            self.onePic.isHidden = true
            
            self.firstPic.isHidden = true
            self.secondPic.isHidden = true
            self.thirdPic.isHidden = true
            self.fourthPic.isHidden = true
            self.fifthPic.isHidden = true
            self.sixthPic.isHidden = true
            self.seventhPic.isHidden = true
            self.eighthPic.isHidden = true
            self.ninethPic.isHidden = true
            
        } else {
            self.onePic.isHidden = true
            
            self.firstPic.isHidden = false
            self.secondPic.isHidden = false
            self.thirdPic.isHidden = false
            self.fourthPic.isHidden = false
            self.fifthPic.isHidden = false
            self.sixthPic.isHidden = false
            self.seventhPic.isHidden = false
            self.eighthPic.isHidden = true
            self.ninethPic.isHidden = true
            
        }
        
        if let bpaopc = buttonPanelAndOnePicConstraint {
            self.buttonPanelAndOnePicConstraint.priority = !self.onePic.isHidden ? 750 : 250
        }
        self.buttonPanelAndFirstPicConstraint.priority = !self.firstPic.isHidden && self.fourthPic.isHidden && self.seventhPic.isHidden ? 750 : 250
        self.buttonPanelAndFourthPicConstraint.priority = !self.fourthPic.isHidden && self.seventhPic.isHidden ? 750 : 250
        self.buttonPanelAndSeventhPicConstraint.priority = !self.seventhPic.isHidden ? 750 : 250
        self.buttonPanelAndContentLbl.priority = firstPic.isHidden && onePic.isHidden ? 750 : 250
        
        if onePic.isHidden {
            if let opt = onePicTop {
                onePicTop.isActive = false
            }
            if let opl = onePicLeft {
                onePicLeft.isActive = false
            }
            if let bpaopc = buttonPanelAndOnePicConstraint{
                buttonPanelAndOnePicConstraint.isActive = false
            }
        } else {
            onePicTop.isActive = true
            onePicLeft.isActive = true
            buttonPanelAndOnePicConstraint.isActive = true
        }
        
        if seventhPic.isHidden {
            seventhPicLeft.isActive = false
            seventhPicTop.isActive = false
            eighthPicLeft.isActive = false
            eighthPicTop.isActive = false
            ninethPicLeft.isActive = false
            ninethPicTop.isActive = false
            buttonPanelAndSeventhPicConstraint.isActive = false
        } else {
            seventhPicLeft.isActive = true
            seventhPicTop.isActive = true
            eighthPicLeft.isActive = true
            eighthPicTop.isActive = true
            ninethPicLeft.isActive = true
            ninethPicTop.isActive = true
            buttonPanelAndSeventhPicConstraint.isActive = true
        }
        
        if fourthPic.isHidden {
            fourthPicTop.isActive = false
            fourthPicLeft.isActive = false
            fifthPicTop.isActive = false
            fifthPicLeft.isActive = false
            sixthPicTop.isActive = false
            sixthPicLeft.isActive = false
            buttonPanelAndFourthPicConstraint.isActive = false
        } else {
            fourthPicTop.isActive = true
            fourthPicLeft.isActive = true
            fifthPicTop.isActive = true
            fifthPicLeft.isActive = true
            sixthPicTop.isActive = true
            sixthPicLeft.isActive = true
            buttonPanelAndFourthPicConstraint.isActive = true
        }
        
        if firstPic.isHidden {
            firstPicTop.isActive = false
            firstPicLeft.isActive = false
            secondPicTop.isActive = false
            secondPicLeft.isActive = false
            thirdPicTop.isActive = false
            thirdPicLeft.isActive = false
            buttonPanelAndFirstPicConstraint.isActive = false
        } else {
            firstPicTop.isActive = true
            firstPicLeft.isActive = true
            secondPicTop.isActive = true
            secondPicLeft.isActive = true
            thirdPicTop.isActive = true
            thirdPicLeft.isActive = true
            buttonPanelAndFirstPicConstraint.isActive = true
        }
        
        
        if self.buttonPanel != nil {
            self.buttonPanel.initPanel()
        }
    }

}
