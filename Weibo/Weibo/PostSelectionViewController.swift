//
//  PostSelectionViewController.swift
//  Weibo
//
//  Created by Ant on 3/28/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class PostSelectionViewController: UIViewController {

    @IBOutlet weak var textBtn: UIStackView!
    @IBOutlet weak var mediaBtn: UIStackView!
    @IBOutlet weak var topBtn: UIStackView!
    @IBOutlet weak var checkinBtn: UIStackView!
    @IBOutlet weak var dianpingBtn: UIStackView!
    @IBOutlet weak var moreBtn: UIStackView!
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBAction func cancelBtnPressed(sender: UIButton) {
        
        
        let WINDOW_HEIGHT = self.view.frame.height
        let BTN_HEIGHT = self.textBtn.frame.height
        
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
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
