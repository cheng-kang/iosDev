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
    
    @IBOutlet weak var searchBarView: SearchBarButtonView!
    var weibo = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBarView.configureView(COLOR_LIGHT_GREY ,barBgColor: UIColor.whiteColor(), content: "大家正在搜：谁是世界上最帅的人")
    }
    
    override func viewWillAppear(animated: Bool) {
//        for subView in searchBar.subviews  {
//            for subsubView in subView.subviews  {
//                if let bg = subsubView as? UIView {
//                    bg.layer.borderColor = COLOR_LIGHT_GREY.cgcOLOR
//                    bg.layer.borderWidth = 1
//                }
//                if let textField = subsubView as? UITextField {
////                    textField.layer.borderWidth = 0
//                }
//            }
//        }
//        searchBar.barTintColor = COLOR_LIGHT_GREY
        
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
            
            let tapToForward = UITapGestureRecognizer(target: self, action: "goToForwardPost:")
            cell.buttonPanel.firstButtonView.addGestureRecognizer(tapToForward)
            let tapToComment = UITapGestureRecognizer(target: self, action: "goToCommentPost:")
            cell.buttonPanel.secondeButtonView.addGestureRecognizer(tapToComment)
            
            return cell
        } else {
            let cell = PostCell()
            cell.initCell(indexPath.row)
            return cell
        }
    }
    
    func goToForwardPost(tagGesture: UITapGestureRecognizer) {
        
        let tapLocation = tagGesture.locationInView(self.tableView)
        let indexPath: NSIndexPath = self.tableView.indexPathForRowAtPoint(tapLocation)!
        
        print(indexPath.row)
        
        performSegueWithIdentifier("GoToForwardPost", sender: nil)
    }
    
    func goToCommentPost(tagGesture: UITapGestureRecognizer) {
        
        let tapLocation = tagGesture.locationInView(self.tableView)
        let indexPath: NSIndexPath = self.tableView.indexPathForRowAtPoint(tapLocation)!
        
        print(indexPath.row)
        
        performSegueWithIdentifier("GoToCommentPost", sender: nil)
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

