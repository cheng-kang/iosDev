//
//  TabBarViewController.swift
//  Weibo
//
//  Created by Ant on 3/28/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var textBtn: UIStackView!
    var mediaBtn: UIStackView!
    var topBtn: UIStackView!
    var checkinBtn: UIStackView!
    var dianpingBtn: UIStackView!
    var moreBtn: UIStackView!
    var cancelBtn: UIButton!
    
    var textBtnPosY: CGFloat!
    var mediaBtnPosY: CGFloat!
    var topBtnPosY: CGFloat!
    var checkinBtnPosY: CGFloat!
    var dianpingBtnPosY: CGFloat!
    var moreBtnPosY: CGFloat!
    
    var popView: UIView!
    var blurView: UIView!
    
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let WINDOW_HEIGHT = self.view.frame.height
        let TAB_HEIGHT = self.tabBar.frame.height
        let GRID_WIDTH = self.view.frame.width / 5
        let MARGIN_X = CGFloat(2)
        let MARGIN_Y = CGFloat(5)
        let BTN_WIDTH = TAB_HEIGHT - MARGIN_X * 2
        let BTN_HEIGHT = TAB_HEIGHT - MARGIN_Y * 2
        
        let modalView = UIView()
        modalView.frame = CGRect(x: GRID_WIDTH * 2, y: WINDOW_HEIGHT - TAB_HEIGHT, width: GRID_WIDTH, height: TAB_HEIGHT)
        self.view.addSubview(modalView)
        
        let postBtn = UIButton()
        postBtn.frame = CGRect(x: GRID_WIDTH * 2 + (GRID_WIDTH - BTN_WIDTH) / 2, y: WINDOW_HEIGHT - TAB_HEIGHT + MARGIN_Y, width: BTN_WIDTH, height: BTN_HEIGHT)
        postBtn.setBackgroundImage(UIImage(named: "post_btn"), for: UIControlState())
        self.view.addSubview(postBtn)
        
        postBtn.addTarget(self, action: #selector(TabBarViewController.postButtonClicked(_:)), for: .touchUpInside)
        
        
        
    }
    
    func postButtonClicked(_ sender: UIButton) {
        if !flag {
            
            print(flag)
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
            self.view.addSubview(blurView)
            
            self.blurView = blurView
            
            
            let PSVC = self.storyboard?.instantiateViewController(withIdentifier: "PostSelection") as! PostSelectionViewController
            PSVC.modalTransitionStyle = .crossDissolve
            self.view.addSubview(PSVC.view)
            
            self.textBtn = PSVC.textBtn
            self.mediaBtn = PSVC.mediaBtn
            self.topBtn = PSVC.topBtn
            self.checkinBtn = PSVC.checkinBtn
            self.dianpingBtn = PSVC.dianpingBtn
            self.moreBtn = PSVC.moreBtn
            self.cancelBtn = PSVC.cancelBtn
            
            self.textBtnPosY = PSVC.textBtn.frame.origin.y
            self.mediaBtnPosY = PSVC.mediaBtn.frame.origin.y
            self.topBtnPosY = PSVC.topBtn.frame.origin.y
            self.checkinBtnPosY = PSVC.checkinBtn.frame.origin.y
            self.dianpingBtnPosY = PSVC.dianpingBtn.frame.origin.y
            self.moreBtnPosY = PSVC.moreBtn.frame.origin.y
            
            self.popView = PSVC.view
            
            self.popView.alpha = 0
            self.blurView.alpha = 0
            
            self.cancelBtn!.addTarget(self, action: #selector(TabBarViewController.cancelBtnPressed(_:)), for: .touchUpInside)
            
            self.flag = true
        }
        
        UIView.animate(withDuration: 0.7, animations: { () -> Void in
            
            self.cancelBtn.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
            self.popView.alpha = 1
            self.blurView.alpha = 1
        }) 
        
        let WINDOW_HEIGHT = self.view.frame.height
        let BTN_HEIGHT = self.textBtn.frame.height
        self.textBtn.frame.origin.y = WINDOW_HEIGHT
        self.mediaBtn.frame.origin.y = WINDOW_HEIGHT
        self.topBtn.frame.origin.y = WINDOW_HEIGHT
        self.checkinBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
        self.dianpingBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
        self.moreBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
        
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.textBtn.frame.origin.y = self.textBtnPosY
            }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.mediaBtn.frame.origin.y = self.mediaBtnPosY
            }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.4, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.topBtn.frame.origin.y = self.topBtnPosY
            }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.checkinBtn.frame.origin.y = self.checkinBtnPosY
            }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.dianpingBtn.frame.origin.y = self.dianpingBtnPosY
            }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.4, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.moreBtn.frame.origin.y = self.moreBtnPosY
            }, completion: nil)
    }
    
    func cancelBtnPressed(_ sender: UIButton) {
        
        
        let WINDOW_HEIGHT = self.view.frame.height
        let BTN_HEIGHT = self.textBtn!.frame.height
        
        
        UIView.animate(withDuration: 0.7, delay: 0.5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.textBtn.frame.origin.y = WINDOW_HEIGHT
            }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.3, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.mediaBtn.frame.origin.y = WINDOW_HEIGHT
            }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.1, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.topBtn.frame.origin.y = WINDOW_HEIGHT
            }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.4, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.checkinBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
            }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.2, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.dianpingBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
            }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.moreBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
            }, completion: nil)
        UIView.animate(withDuration: 1.3, animations: { () -> Void in
            self.blurView.alpha = 0
            self.popView.alpha = 0
            self.cancelBtn.transform = CGAffineTransform(rotationAngle: CGFloat(0))
        }) 
        
    }
    
    

}
