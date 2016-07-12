//
//  ViewController.swift
//  cocoapods test
//
//  Created by Ant on 3/15/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let linkedinHelper = LinkedinSwiftHelper(configuration: LinkedinSwiftConfiguration(clientId: "75d6fkd2wqyp3m", clientSecret: "iqkDGYpWdhf7WKzA", state: "DnVUH9C6XeeLOCEL", permissions: ["r_basicprofile", "r_emailaddress"]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

