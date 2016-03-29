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
        modalView.frame = CGRectMake(GRID_WIDTH * 2, WINDOW_HEIGHT - TAB_HEIGHT, GRID_WIDTH, TAB_HEIGHT)
        self.view.addSubview(modalView)
        
        let postBtn = UIButton()
        postBtn.frame = CGRectMake(GRID_WIDTH * 2 + (GRID_WIDTH - BTN_WIDTH) / 2, WINDOW_HEIGHT - TAB_HEIGHT + MARGIN_Y, BTN_WIDTH, BTN_HEIGHT)
        postBtn.setBackgroundImage(UIImage(named: "post_btn"), forState: .Normal)
        self.view.addSubview(postBtn)
        
        postBtn.addTarget(self, action: "postButtonClicked:", forControlEvents: .TouchUpInside)
        
        
        
    }
    
    func postButtonClicked(sender: UIButton) {
        if !flag {
            
            print(flag)
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
            self.view.addSubview(blurView)
            
            self.blurView = blurView
            
            
            let PSVC = self.storyboard?.instantiateViewControllerWithIdentifier("PostSelection") as! PostSelectionViewController
            PSVC.modalTransitionStyle = .CrossDissolve
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
            
            self.cancelBtn!.addTarget(self, action: "cancelBtnPressed:", forControlEvents: .TouchUpInside)
            
            self.flag = true
        }
        
        UIView.animateWithDuration(0.7) { () -> Void in
            self.popView.alpha = 1
            self.blurView.alpha = 1
        }
        
        let WINDOW_HEIGHT = self.view.frame.height
        let BTN_HEIGHT = self.textBtn.frame.height
        self.textBtn.frame.origin.y = WINDOW_HEIGHT
        self.mediaBtn.frame.origin.y = WINDOW_HEIGHT
        self.topBtn.frame.origin.y = WINDOW_HEIGHT
        self.checkinBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
        self.dianpingBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
        self.moreBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
        
        
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.textBtn.frame.origin.y = self.textBtnPosY
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.mediaBtn.frame.origin.y = self.mediaBtnPosY
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.4, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.topBtn.frame.origin.y = self.topBtnPosY
            }, completion: nil)
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.checkinBtn.frame.origin.y = self.checkinBtnPosY
            }, completion: nil)
        UIView.animateWithDuration(1, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.dianpingBtn.frame.origin.y = self.dianpingBtnPosY
            }, completion: nil)
        UIView.animateWithDuration(1, delay: 0.4, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.moreBtn.frame.origin.y = self.moreBtnPosY
            }, completion: nil)
    }
    
    func cancelBtnPressed(sender: UIButton) {
        
        
        let WINDOW_HEIGHT = self.view.frame.height
        let BTN_HEIGHT = self.textBtn!.frame.height
        
        
        UIView.animateWithDuration(0.7, delay: 0.5, options: [.CurveEaseInOut], animations: { () -> Void in
            self.textBtn.frame.origin.y = WINDOW_HEIGHT
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.3, options: [.CurveEaseInOut], animations: { () -> Void in
            self.mediaBtn.frame.origin.y = WINDOW_HEIGHT
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.1, options: [.CurveEaseInOut], animations: { () -> Void in
            self.topBtn.frame.origin.y = WINDOW_HEIGHT
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.4, options: [.CurveEaseInOut], animations: { () -> Void in
            self.checkinBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.2, options: [.CurveEaseInOut], animations: { () -> Void in
            self.dianpingBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0, options: [.CurveEaseInOut], animations: { () -> Void in
            self.moreBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
            }, completion: nil)
        UIView.animateWithDuration(1.3) { () -> Void in
            self.blurView.alpha = 0
            self.popView.alpha = 0
        }
        
    }
    
    

}
