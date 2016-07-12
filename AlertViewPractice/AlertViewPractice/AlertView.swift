//
//  AlertView.swift
//  AlertViewPractice
//
//  Created by Ant on 5/28/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class AlertView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var dismissBtn: UIButton!
    
    let ApplicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    
    private var screen: UIView {
        return ApplicationDelegate.window!
    }
    
    private var modalBtn = UIButton(type: .Custom)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.modalBtn.backgroundColor = UIColor.blackColor()
        self.modalBtn.addTarget(self, action: #selector(AlertView.dismissAlert), forControlEvents: .TouchUpInside)
        
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    
    func show() {
//        self.screen.addSubview(self.modalBtn)
//        self.screen.addSubview(self)
//        
//        self.modalBtn.frame = CGRectMake(0, 0, self.screen.frame.width, self.screen.frame.height)
//        self.center = self.modalBtn.center
//        
//        let size = UIScreen.mainScreen().bounds.size
//        self.modalBtn.center = CGPoint(x: size.width/2, y: size.height/4)
//        self.modalBtn.frame = self.screen.bounds
//        
//        UIView.animateWithDuration(0.25) {
//            self.alpha = 1
//            self.modalBtn.alpha = 1
//        }
        
        let size = UIScreen.mainScreen().bounds.size
        self.modalBtn.center = CGPoint(x: size.width/2, y: size.height/4)
        self.modalBtn.frame = self.screen.bounds
        self.modalBtn.alpha = 0
        self.alpha = 0
        
        
        self.transform = CGAffineTransformMakeScale(1.2, 1.2)
        
        
        UIView.animateWithDuration(0.25) {
            
            self.modalBtn.alpha = 0.4
            self.screen.addSubview(self.modalBtn)
            
            UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: .CurveEaseInOut, animations: {
                self.screen.addSubview(self)
                self.center = self.modalBtn.center
                self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                
                self.alpha = 1
                }, completion: { (_) in
                    self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    self.screen.addSubview(self)
                    self.alpha = 1
            })
        }
    }
    
    class func alertView() -> AlertView {
        let alert = NSBundle.mainBundle().loadNibNamed("AlertView", owner: nil, options: nil).first as! AlertView
        return alert
    }
    
    @objc private func dismissAlert() {
        UIView.animateWithDuration(0.15, animations: { 
            self.modalBtn.alpha = 0
            self.alpha = 0
            }) { (isSuccess) in
                self.modalBtn.removeFromSuperview()
                self.removeFromSuperview()
        }
    }

    @IBAction func dismissBtnClick(sender: UIButton) {
        dismissAlert()
    }
}
