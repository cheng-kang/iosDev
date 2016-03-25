//
//  ColorAnimationViewController.swift
//  AnimationPractice
//
//  Created by Ant on 3/25/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ColorAnimationViewController: UIViewController {

    @IBOutlet weak var redSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        UIView.animateWithDuration(1) { () -> Void in
            self.redSquare.backgroundColor = UIColor.greenColor()
        }
    }

}
