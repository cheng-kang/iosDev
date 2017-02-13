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
    
    override func viewDidAppear(_ animated: Bool) {
        
        let maskPathAllCorner = UIBezierPath(roundedRect: noticeBtn.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight, .topLeft, .topRight],
            cornerRadii: CGSize(width: 5, height: 5.0))
        let maskPathTopCorner = UIBezierPath(roundedRect: noticeBtn.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 5, height: 5.0))
        let maskPathBottomCorner = UIBezierPath(roundedRect: noticeBtn.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 5, height: 5.0))
        let shapeAllCorner = CAShapeLayer()
        shapeAllCorner.path = maskPathAllCorner.cgPath
        let shapeTopCorner = CAShapeLayer()
        shapeTopCorner.path = maskPathTopCorner.cgPath
        let shapeBottomCorner = CAShapeLayer()
        shapeBottomCorner.path = maskPathBottomCorner.cgPath
        
        reportBtn.layer.mask = shapeTopCorner
        noticeBtn.layer.mask = shapeBottomCorner
        dismissBtn.layer.mask = shapeAllCorner
    }
    @IBAction func bgTapped(_ sender: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name("DismissBottomMenu"), object: nil)
    }
    @IBAction func dismissBtnPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("DismissBottomMenu"), object: nil)
    }
}
