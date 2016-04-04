//
//  FourthViewController.swift
//  Instagram
//
//  Created by Ant on 3/31/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableViewLeft: UITableView!
    @IBOutlet weak var tabPanel: UIView!
    
    let scrollBar = UIView()
    var notifications: [Notification] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        let notification1 = Notification(from: "CHENGKANG", fromAvatar: UIImage(named: "IMG_8040")!, to: "Deer", toAvatar: UIImage(named: "test")!, type: "like", images: [UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!, ], date: "3天前")
        let notification2 = Notification(from: "CHENGKANG", fromAvatar: UIImage(named: "IMG_8040")!, to: "Deer", toAvatar: UIImage(named: "test")!, type: "like", images: [UIImage(named: "test")!], date: "3天前")
        
        self.notifications.append(notification1)
        self.notifications.append(notification2)
    }
    
    func initView() {
        
        tableViewLeft.delegate = self
        tableViewLeft.dataSource = self
        
        tabPanel.layer.shadowColor = COLOR_GREY.CGColor
        tabPanel.layer.shadowRadius = 0.5
        tabPanel.layer.shadowOffset = CGSizeMake(0, 0.5)
        tabPanel.layer.shadowOpacity = 1; //default is 0.0
        
        self.view.addSubview(self.scrollBar)
        self.scrollBar.backgroundColor = COLOR_BLUE
        self.scrollBar.frame = CGRectMake(0, 87, self.view.frame.width / 2, 3)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if self.notifications[indexPath.row].images.count == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("LikeWithPicCell") as! LikeWithPicCell
            cell.initCell(self.notifications[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("LikeWithPicsCell") as! LikeWithPicsCell
            cell.initCell(self.notifications[indexPath.row])
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notifications.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
