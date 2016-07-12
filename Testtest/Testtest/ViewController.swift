//
//  ViewController.swift
//  Testtest
//
//  Created by Ant on 16/7/8.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var clickBtn: UIButton!
    @IBOutlet weak var changeTextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        descLbl.text = "Label text"
        img.image = UIImage(named: "2")
        
        let newImgView = UIImageView()
        newImgView.image = UIImage(named: "1")
        self.view.addSubview(newImgView)
        newImgView.frame = CGRectMake(0, 150, 300, 300)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeText(sender: UIButton) {
        descLbl.text = "Text Changed!"
    }

}

