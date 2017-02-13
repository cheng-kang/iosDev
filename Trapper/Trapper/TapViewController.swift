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
    
    @IBAction func tapTapTap(_ sender: UIButton) {
        tapCount += 1
        if !isGameOver() {
            updateTapsLbl()
        }else{
            let mv = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(mv, animated: true, completion: nil)
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
