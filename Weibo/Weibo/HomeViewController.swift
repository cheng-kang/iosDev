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
    
    var weibo = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        for subView in searchBar.subviews  {
            for subsubView in subView.subviews  {
                if let bg = subsubView as? UIView {
                    bg.layer.borderColor = LIGHT_GREY_COLOR.CGColor
                    bg.layer.borderWidth = 1
                }
                if let textField = subsubView as? UITextField {
//                    textField.layer.borderWidth = 0
                }
            }
        }
        searchBar.barTintColor = LIGHT_GREY_COLOR
        
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.initCell(indexPath.row)
            return cell
        } else {
            let cell = PostCell()
            cell.initCell(indexPath.row)
            return cell
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    @IBAction func goToForwardBox(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("GoToForwardBox", sender: nil)
    }
    @IBAction func goToCommentBox(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("GoToCommentBox", sender: nil)
    }
    

}

