//
//  FirstViewController.swift
//  To-do List
//
//  Created by Ant on 3/9/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var taskTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        taskTbl.tableFooterView = UIView(frame: CGRectZero)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if(tableView(taskTbl, numberOfRowsInSection: 1) == 0){
            let emptyStateLabel = UILabel(frame: taskTbl.frame)
            emptyStateLabel.text = "Add a new task!"
            emptyStateLabel.textAlignment = NSTextAlignment.Center
            emptyStateLabel.textColor = UIColor.lightGrayColor()
            
            taskTbl.backgroundView = emptyStateLabel
        }else{
            taskTbl.backgroundView = nil
        }
        taskTbl.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            taskMgr.tasks.removeAtIndex(indexPath.row)
            taskTbl.reloadData()
        }
    }

    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
    }

}

