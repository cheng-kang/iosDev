//
//  FourthViewController.swift
//  Instagram
//
//  Created by Ant on 3/31/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var tableViewLeft: UITableView!
    @IBOutlet weak var tableViewRight: UITableView!
    @IBOutlet weak var tabPanel: UIView!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var youBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let scrollBar = UIView()
    var notifications: [Notification] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建模拟数据
        let notification1 = Notification(from: "CHENGKANG", fromAvatar: UIImage(named: "IMG_8040")!, to: "Deer", toAvatar: UIImage(named: "test")!, type: "like", images: [UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!, ], date: "3天前")
        let notification2 = Notification(from: "CHENGKANG", fromAvatar: UIImage(named: "IMG_8040")!, to: "Deer", toAvatar: UIImage(named: "test")!, type: "like", images: [UIImage(named: "test")!], date: "3天前")
        
        //添加模拟数据
        self.notifications.append(notification1)
        self.notifications.append(notification2)
        
        //初始化要用到的参数
        let WIDTH = self.view.frame.width
        let HEIGHT = self.view.frame.height - 60 - 30 - 49
        
        //设置 tab 标签面板底部阴影
        self.tabPanel.layer.shadowColor = COLOR_GREY.CGColor
        self.tabPanel.layer.shadowRadius = 0.5
        self.tabPanel.layer.shadowOffset = CGSizeMake(0, 0.5)
        self.tabPanel.layer.shadowOpacity = 1
        
        //添加 tab 标签面板底部蓝条
        self.view.addSubview(self.scrollBar)
        self.scrollBar.backgroundColor = COLOR_LIGHT_BLUE
        self.scrollBar.frame = CGRectMake(0, 87, WIDTH / 2, 3)
        
        //初始化按钮颜色
        self.followBtn.setTitleColor(COLOR_LIGHT_BLUE, forState: .Normal)
        
        //设置 scrollView delegate
        self.scrollView.delegate = self
        
        //设置 tableViewLeft delegate，并消除多余分割线
        self.tableViewLeft.delegate = self
        self.tableViewLeft.dataSource = self
        self.tableViewLeft.tableFooterView = UIView()
        
        //设置 tableViewRight delegate，并消除多余分割线
        self.tableViewRight.delegate = self
        self.tableViewRight.dataSource = self
        self.tableViewRight.tableFooterView = UIView()

        //设置 scrollView contentSize
        self.scrollView.contentSize = CGSizeMake(WIDTH * 2, HEIGHT)
        //设置两个 tableView 大小位置
        self.tableViewLeft.frame = CGRectMake(8, 0, WIDTH - 16, HEIGHT)
        self.tableViewRight.frame = CGRectMake(WIDTH + 8, 0, WIDTH - 16, HEIGHT)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //可以通过判断当前 tableView 是否与某一个 TableView 相同来给定对应内容
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
            //此处 -1 是为了让展示内容有区分，因为用的相同数据
            return self.notifications.count - 1
        }
        
        return self.notifications.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //判断当前 scrollView 是我们项目中的 ScrollView 而非那两个 tableView
        if scrollView == self.scrollView {
            //改变 scrollBar x 坐标，达成同步滑动效果。
            let offsetX = scrollView.contentOffset.x
            self.scrollBar.frame = CGRectMake(offsetX / 2, 87, self.view.frame.width / 2, 3)
            
            //对应修改 btn 文字颜色
            if offsetX > self.view.frame.width / 2 {
                self.followBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
                self.youBtn.setTitleColor(COLOR_LIGHT_BLUE, forState: .Normal)
            } else {
                self.followBtn.setTitleColor(COLOR_LIGHT_BLUE, forState: .Normal)
                self.youBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            }
        }
    }
    @IBAction func followBtnPressed(sender: UIButton) {
        //点击按钮时，通过动画移动到对应 tableView
        UIView.animateWithDuration(0.3, delay: 0, options: [.CurveEaseInOut], animations: { () -> Void in
            self.scrollView.contentOffset.x = 0
            }, completion: nil)
    }
    
    @IBAction func youBtnPressed(sender: UIButton) {
        //点击按钮时，通过动画移动到对应 tableView
        UIView.animateWithDuration(0.3, delay: 0, options: [.CurveEaseInOut], animations: { () -> Void in
            self.scrollView.contentOffset.x = self.view.frame.width
            }, completion: nil)
    }

}
