//
//  ExploreViewController.swift
//  Weibo
//
//  Created by Ant on 3/27/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: SearchBarButtonView!
    
    var sections: [[Dictionary<String, AnyObject>]] = [
        [
            [
                "image" : UIImage(named: "explore_hot")!,
                "title" : "热门微博",
                "subtitle" : "全站最热微博尽搜罗",
                "new": true
            ],
            [
                "image" : UIImage(named: "explore_find")!,
                "title" : "找人",
                "subtitle" : "",
                "new": false
            ],
        ],
        [
            [
                "image" : UIImage(named: "explore_top")!,
                "title" : "微博头条",
                "subtitle" : "随时随地一起看新闻",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_game")!,
                "title" : "玩游戏",
                "subtitle" : "",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_around")!,
                "title" : "周边",
                "subtitle" : "发现\"英国\"值得去的地儿",
                "new": false
            ],
        ],
        [
            [
                "image" : UIImage(named: "explore_stock")!,
                "title" : "股票",
                "subtitle" : "",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_film")!,
                "title" : "电影",
                "subtitle" : "",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_hongrentao")!,
                "title" : "红人淘",
                "subtitle" : "",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_music")!,
                "title" : "听歌",
                "subtitle" : "",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_travel")!,
                "title" : "旅游",
                "subtitle" : "",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_more")!,
                "title" : "更多频道",
                "subtitle" : "",
                "new": false
            ],
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.backgroundColor = LIGHT_GREY_COLOR
        self.tableView.backgroundColor = LIGHT_GREY_COLOR
        
        searchBar.configureView(UIColor.clearColor(), barBgColor: UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1), content: "大家正在搜：程康是谁啊")
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BarCell") as! BarCell
        cell.initCell(sections[indexPath.section][indexPath.row]["image"] as! UIImage, title: sections[indexPath.section][indexPath.row]["title"] as! String, subtitle: sections[indexPath.section][indexPath.row]["subtitle"] as! String, new: sections[indexPath.section][indexPath.row]["new"] as! Bool)
        
        if indexPath.row == sections[indexPath.section].count - 1 {
            cell.layer.shadowOffset = CGSizeMake(0, 0.5)
            cell.layer.shadowColor = UIColor.lightGrayColor().CGColor;
            cell.layer.shadowRadius = 0.5
            cell.layer.shadowOpacity = 0.3
            cell.clipsToBounds = false
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        view.backgroundColor = UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vw = UIView()
        return vw
    }
}
