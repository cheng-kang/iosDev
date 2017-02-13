//
//  MeViewController.swift
//  Weibo
//
//  Created by Ant on 3/28/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoBar: UIStackView!
    @IBOutlet weak var infoBarTop: UIStackView!
    @IBOutlet weak var infoBarBottom: UIStackView!
    @IBOutlet weak var infoBarBottomLine: UIView!
    @IBOutlet weak var seperator: UIView!
    @IBOutlet weak var avatar: RoundImageWithBorder!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    
    
    var user: Dictionary<String, Any> = [
        "avatar" : UIImage(named: "avatar")!,
        "username" : "雷森图喵喜客",
        "desc" : "简介：一切白的东西和你相比都如同黑墨水一般自惭形秽",
    ]
    var sections: [[Dictionary<String, Any>]] = [
        [
            [
                "image" : UIImage(named: "me_newfriend")!,
                "title" : "新的好友",
                "subtitle" : "",
                "segue" : "GoToNewFriend",
                "new": false
            ],
        ],
        [
            [
                "image" : UIImage(named: "me_album")!,
                "title" : "我的相册",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
            [
                "image" : UIImage(named: "me_dianping")!,
                "title" : "我的点评",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": true
            ],
            [
                "image" : UIImage(named: "me_likes")!,
                "title" : "我的赞",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
        ],
        [
            [
                "image" : UIImage(named: "me_pay")!,
                "title" : "微博支付",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": true
            ],
            [
                "image" : UIImage(named: "me_sports")!,
                "title" : "微博运动",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
        ],
        [
            [
                "image" : UIImage(named: "me_fanstop")!,
                "title" : "粉丝头条",
                "subtitle" : "推广博文及账号的利器",
                "segue" : "GoToHot",
                "new": true
            ],
            [
                "image" : UIImage(named: "me_fansservice")!,
                "title" : "粉丝服务",
                "subtitle" : "橱窗、私信、营销、数据中心",
                "segue" : "GoToHot",
                "new": false
            ],
        ],
        [
            [
                "image" : UIImage(named: "me_drafts")!,
                "title" : "草稿箱",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": true,
                "count" : 2
            ],
        ],
        [
            [
                "image" : UIImage(named: "me_more")!,
                "title" : "更多",
                "subtitle" : "文章、收藏",
                "segue" : "GoToHot",
                "new": false
            ],
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.backgroundColor = COLOR_LIGHT_GREY
        self.tableView.backgroundColor = COLOR_LIGHT_GREY
        
        initUserInfo()
    }
    
    func initUserInfo() {
        self.avatar.image = self.user["avatar"] as! UIImage
        self.username.text = self.user["username"] as! String
        self.desc.text = self.user["desc"] as! String
        
        self.infoBarTop.layer.borderColor = COLOR_LIGHT_GREY.cgColor
        self.infoBarTop.layer.borderWidth = 1
        
        
        self.infoBarBottomLine.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.infoBarBottomLine.layer.shadowColor = UIColor.lightGray.cgColor;
        self.infoBarBottomLine.layer.shadowRadius = 0.5
        self.infoBarBottomLine.layer.shadowOpacity = 0.3
        self.infoBarBottomLine.clipsToBounds = false
        
        
//        seperator.layer.zPosition = 1
//        infoBarBottomLine.layer.zPosition = 5
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarCell") as! BarCell
        cell.initCell(self.sections[indexPath.section][indexPath.row]["image"] as! UIImage, title: self.sections[indexPath.section][indexPath.row]["title"] as! String, subtitle: self.sections[indexPath.section][indexPath.row]["subtitle"] as! String, new: self.sections[indexPath.section][indexPath.row]["new"] as! Bool)
        
        if indexPath.row == sections[indexPath.section].count - 1 {
            cell.layer.shadowOffset = CGSize(width: 0, height: 0.5)
            cell.layer.shadowColor = UIColor.lightGray.cgColor;
            cell.layer.shadowRadius = 0.5
            cell.layer.shadowOpacity = 0.3
            cell.clipsToBounds = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        view.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vw = UIView()
        return vw
    }

}



































