//
//  DSDanmuTestViewController.swift
//  Danmu
//
//  Created by Ant on 28/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import UIKit

class DSDanmuTestViewController: UIViewController {
    var DSDM: DSDanmuManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DSDM = DSDanmuManager(with: self.view)

        // Do any additional setup after loading the view.
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
    
    @IBAction func randomDanmuBtnClick(sender: UIButton) {
        DSDM.addRandom()
    }
    @IBAction func randomDanmu100BtnClick(sender: UIButton) {
        for _ in 0..<100 {
            DSDM.addRandom()
        }
    }
    @IBAction func togglePauseBtnClick(sender: UIButton) {
        DSDM.togglePause()
    }
}
