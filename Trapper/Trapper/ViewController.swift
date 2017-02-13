//
//  ViewController.swift
//  Trapper
//
//  Created by Ant on 3/10/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

var tapMax = 0;

class ViewController: UIViewController {
    
    @IBOutlet weak var maxNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func play(_ sender: UIButton) {
        if Int(maxNumber.text!) != nil{
            print(maxNumber.text)
            print(Int(maxNumber.text!)!)
            
            tapMax = Int(maxNumber.text!)!
            
            let tv = self.storyboard?.instantiateViewController(withIdentifier: "TapViewController") as! TapViewController
            self.present(tv, animated: true, completion: nil)
        }
    }
}

