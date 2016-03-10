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
        
        tapTimesText.text = "\(tapCount) Taps"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapTapTap(sender: UIButton) {
        print(tapCount)
        if tapCount < tapMax {
            tapCount++
            print(tapCount)
            tapTimesText.text = "\(tapCount) Taps"
        }else{
            let mv = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            self.presentViewController(mv, animated: true, completion: nil)
        }
    }
}
