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
        
        
        taskTbl.tableFooterView = UIView(frame: CGRect.zero)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(tableView(taskTbl, numberOfRowsInSection: 1) == 0){
            let emptyStateLabel = UILabel(frame: taskTbl.frame)
            emptyStateLabel.text = "Add a new task!"
            emptyStateLabel.textAlignment = NSTextAlignment.center
            emptyStateLabel.textColor = UIColor.lightGray
            
            taskTbl.backgroundView = emptyStateLabel
        }else{
            taskTbl.backgroundView = nil
        }
        taskTbl.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.delete){
            taskMgr.tasks.remove(at: indexPath.row)
            taskTbl.reloadData()
        }
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "test")
        
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
    }

}

