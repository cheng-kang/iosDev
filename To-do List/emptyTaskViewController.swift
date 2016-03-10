//
//  emptyTaskViewController.swift
//  To-do List
//
//  Created by Ant on 3/10/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

var backgroundView: emptyTaskViewController = emptyTaskViewController()

class emptyTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBOutlet var theView: UIView!
}
