//
//  ViewController.swift
//  CustomRefreshControl
//
//  Created by Ant on 16/7/27.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var data = [
        "a",
        "b",
        "c",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        self.tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let rc = UIRefreshControl()
        rc.frame.size = CGSizeMake(self.view.frame.width, rc.frame.height)
        rc.addTarget(self, action: #selector(ViewController.didRefresh(_:)), forControlEvents: .ValueChanged)
        rc.backgroundColor = UIColor.greenColor()
        
        let lineView = UIView(frame: CGRectMake((rc.frame.width / 2) - 0.5, 0, 1, rc.frame.height))
        lineView.backgroundColor = UIColor.redColor()
        rc.addSubview(lineView)
        
        self.tableview.addSubview(rc)
        self.tableview.sendSubviewToBack(rc)
    }
    
    func didRefresh(sender: UIRefreshControl) {
        let lineView = UIView(frame: CGRectMake((sender.frame.width / 2) - 0.5, 0, 1, sender.frame.height))
        lineView.backgroundColor = UIColor.redColor()
        sender.addSubview(lineView)
        sender.endRefreshing()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

