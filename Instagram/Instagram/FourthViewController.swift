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
    @IBOutlet weak var tableViewRight: UITableView!
    @IBOutlet weak var tabPanel: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let scrollBar = UIView()
    var notifications: [Notification] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let notification1 = Notification(from: "CHENGKANG", fromAvatar: UIImage(named: "IMG_8040")!, to: "Deer", toAvatar: UIImage(named: "test")!, type: "like", images: [UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!, ], date: "3天前")
        let notification2 = Notification(from: "CHENGKANG", fromAvatar: UIImage(named: "IMG_8040")!, to: "Deer", toAvatar: UIImage(named: "test")!, type: "like", images: [UIImage(named: "test")!], date: "3天前")
        
        self.notifications.append(notification1)
        self.notifications.append(notification2)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        initView()
    }
    func initView() {
        
        let WIDTH = self.view.frame.width
        let HEIGHT = self.view.frame.height - 60 - 30 - 49
        
        tableViewLeft.delegate = self
        tableViewLeft.dataSource = self
        
        tableViewRight.delegate = self
        tableViewRight.dataSource = self
        
        tabPanel.layer.shadowColor = COLOR_GREY.CGColor
        tabPanel.layer.shadowRadius = 0.5
        tabPanel.layer.shadowOffset = CGSizeMake(0, 0.5)
        tabPanel.layer.shadowOpacity = 1
        
        self.view.addSubview(self.scrollBar)
        self.scrollBar.backgroundColor = COLOR_BLUE
        self.scrollBar.frame = CGRectMake(0, 87, WIDTH / 2, 3)
        
        
//        self.scrollView.contentSize = CGSizeMake(WIDTH * 2, HEIGHT)
//        self.tableViewLeft.frame = CGRectMake(8, 0, WIDTH - 16, HEIGHT)
//        self.tableViewRight.frame = CGRectMake(WIDTH + 8, 0, WIDTH - 16, HEIGHT)
        
        print(WIDTH)
        print(self.tableViewRight.frame.origin.x)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 2, self.view.frame.height - 60 - 30 - 49)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        if tableView == self.tableViewRight {
//            if self.notifications[indexPath.row].images.count == 1 {
//                let cell = LikeWithPicCell()
//                cell.initCell(self.notifications[indexPath.row])
//                return cell
//            } else {
//                let cell = LikeWithPicsCell()
//                cell.initCell(self.notifications[indexPath.row])
//                return cell
//            }
//        }
        
        print("aabb")
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
        
        if tableView == self.tableViewRight {
            print("aa")
            return self.notifications.count
        }
        return self.notifications.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
