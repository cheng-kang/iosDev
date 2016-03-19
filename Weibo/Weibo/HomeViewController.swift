//
//  FirstViewController.swift
//  Weibo
//
//  Created by Ant on 3/19/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        searchBar.searchBarStyle = UISearchBarStyle.Minimal
        
        
//        searchBar.layer.borderColor = UIColor(red: 230/250, green: 230/250, blue: 230/250, alpha: 1).CGColor
//        searchBar.layer.borderWidth = 1
    }
    
    override func viewWillAppear(animated: Bool) {
        for subView in searchBar.subviews  {
            print(subView)
            for subsubView in subView.subviews  {
                
                print(subsubView)
                if let bg = subsubView as? UIView {
//                    bg.backgroundColor = UIColor.whiteColor()
//                    bg.layer.backgroundColor = UIColor.orangeColor().CGColor
//                    bg.layer.borderColor = UIColor.redColor().CGColor
                    bg.layer.borderColor = UIColor(red: 242/250, green: 242/250, blue: 242/250, alpha: 1).CGColor
//                    bg.layer.borderWidth = 1
                }
                if let textField = subsubView as? UITextField {
//                    textField.backgroundColor = UIColor.clearColor()
//                    textField.layer.borderColor = UIColor.greenColor().CGColor
//                    textField.layer.borderWidth = 0
                }
            }
        }
        
//        searchBar.barTintColor = UIColor.yellowColor()
//        searchBar.tintColor = UIColor.blackColor()
//        searchBar.barTintColor = UIColor.whiteColor()
        searchBar.barTintColor = UIColor(red: 242/250, green: 242/250, blue: 242/250, alpha: 1)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.initCell()
            return cell
        } else {
            let cell = PostCell()
            cell.initCell()
            return cell
        }
    }
    

}

