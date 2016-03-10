//
//  TapViewController.swift
//  Trapper
//
//  Created by Ant on 3/10/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {
    
    
    @IBOutlet weak var tapTimesText: UILabel!
    var tapCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTapsLbl()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapTapTap(sender: UIButton) {
        tapCount++
        if !isGameOver() {
            updateTapsLbl()
        }else{
            let mv = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            self.presentViewController(mv, animated: true, completion: nil)
        }
    }
    
    func updateTapsLbl() {
        tapTimesText.text = "\(tapCount) Taps"
    }
    
    func isGameOver()->Bool {
        print(tapCount)
        print(tapMax)
        print(tapCount >= tapMax)
        return tapCount >= tapMax
    }
}
