//
//  ViewController.swift
//  TheSongs
//
//  Created by Ant on 5/16/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initLayout()
    }

    func initLayout() {
        playButton.layer.shadowColor = UIColor.black.cgColor
        playButton.layer.shadowRadius = 2
        playButton.layer.shadowOffset = CGSize(width: 3, height: 4)
        playButton.layer.shadowOpacity = 0.3
        
        playButton.showsTouchWhenHighlighted = false
        playButton.adjustsImageWhenHighlighted = false
    }


}

