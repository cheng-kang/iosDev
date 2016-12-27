//
//  TestViewController.swift
//  LabelTest
//
//  Created by Ant on 16/9/21.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var restartBtn: UIButton!
    
    let timerA = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.restartBtn.addTarget(self, action: self.restartBtnClick, for: .touchUpInside)
    }
    
    func restartBtnClick(sender: UIButton) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
