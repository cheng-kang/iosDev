//
//  BottomMenuView.swift
//  Instagram
//
//  Created by Ant on 4/3/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class BottomMenuView: UIViewController {

    @IBOutlet weak var menuBgView: UIView!
    @IBOutlet weak var reportBtn: UIButton!
    @IBOutlet weak var shareToFacebookBtn: UIButton!
    @IBOutlet weak var tweetBtn: UIButton!
    @IBOutlet weak var copyURLBtn: UIButton!
    @IBOutlet weak var noticeBtn: UIButton!
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var buttonPanel: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("11")
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let maskPathAllCorner = UIBezierPath(roundedRect: noticeBtn.bounds,
            byRoundingCorners: [.BottomLeft, .BottomRight, .TopLeft, .TopRight],
            cornerRadii: CGSize(width: 5, height: 5.0))
        let maskPathTopCorner = UIBezierPath(roundedRect: noticeBtn.bounds,
            byRoundingCorners: [.TopLeft, .TopRight],
            cornerRadii: CGSize(width: 5, height: 5.0))
        let maskPathBottomCorner = UIBezierPath(roundedRect: noticeBtn.bounds,
            byRoundingCorners: [.BottomLeft, .BottomRight],
            cornerRadii: CGSize(width: 5, height: 5.0))
        let shapeAllCorner = CAShapeLayer()
        shapeAllCorner.path = maskPathAllCorner.CGPath
        let shapeTopCorner = CAShapeLayer()
        shapeTopCorner.path = maskPathTopCorner.CGPath
        let shapeBottomCorner = CAShapeLayer()
        shapeBottomCorner.path = maskPathBottomCorner.CGPath
        
        reportBtn.layer.mask = shapeTopCorner
        noticeBtn.layer.mask = shapeBottomCorner
        dismissBtn.layer.mask = shapeAllCorner
    }
    @IBAction func bgTapped(sender: UITapGestureRecognizer) {
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "DismissBottomMenu", object: nil))
    }
    @IBAction func dismissBtnPressed(sender: UIButton) {
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "DismissBottomMenu", object: nil))
    }
}
