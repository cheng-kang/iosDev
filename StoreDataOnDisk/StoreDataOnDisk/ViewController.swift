//
//  ViewController.swift
//  StoreDataOnDisk
//
//  Created by Ant on 3/13/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aLbl: UILabel!
    
    var people = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            aLbl.text = color
        }
        
        people.append(Person(f: "Di", l: "Huang"))
        people.append(Person(f: "Kang", l: "Cheng"))
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    @IBAction func red(sender: UIButton) {
        aLbl.text = "RED!"
        NSUserDefaults.standardUserDefaults().setValue("RED", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    @IBAction func blue(sender: UIButton) {
        aLbl.text = "BLUE!"
        NSUserDefaults.standardUserDefaults().setValue("BLUE", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadPeopleData = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            if let loadPeople = NSKeyedUnarchiver.unarchiveObjectWithData(loadPeopleData) as? [Person] {
                for person in loadPeople {
                    print("\(person.firstName)-\(person.lastName)")
                }
            }
        }
    }
    
    @IBAction func yellow(sender: UIButton) {
        aLbl.text = "YELLOW!"
        NSUserDefaults.standardUserDefaults().setValue("YELLOW", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

