//
//  FirstViewController.swift
//  Instagram
//
//  Created by Ant on 3/30/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var user: User!
    
    var posts: [Post] = []
    var likeLbls: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: "PostHeaderView", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "PostHeaderView")
        
        user = User(username: "CHENGKANG", avatar: UIImage(named: "IMG_8040")!)
        
        let post1 = Post(username: "CHENGKANG", img: UIImage(named: "test")!, like: ["persona", "personb", "personc", "persond", "persone", "personf", "persong", "CHENGKANG"], comments: [
        ["WOWOWOW!!!", "persona"],
        ["I LOVE YOU!!!", "personb"],
        ["This is a long comment for testing purpose. I don't know what i can input here so just some nonsense. It's not long engough, i'll keep typing until i'm satisfied. I think it's about engough. :D.", "personc"],
        ["this is another one", "persond"],
        ["Thank you!", "CHENGKANG"],
        ], date: "3天前")
        
        let post2 = Post(username: "CHENGKANG", img: UIImage(named: "IMG_8040")!, like: ["persona", "personb", "personc", "persond", "persone", "personf", "persong"], comments: [
            ["WOWOWOW!!!", "persona"],
            ["I LOVE YOU!!!", "personb"],
            ["This is a long comment for testing purpose. I don't know what i can input here so just some nonsense. It's not long engough, i'll keep typing until i'm satisfied. I think it's about engough. :D.", "personc"],
            ["this is another one", "persond"],
            ["Thank you!", "CHENGKANG"],
            ], date: "3天前")
        
        self.posts.append(post1)
        self.posts.append(post2)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        cell.initCell(self.posts[indexPath.section], sectionNumber: indexPath.section, currentUsername: self.user.username)
        
        likeLbls.append(cell.likeLbl)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("PostHeaderView") as! PostHeader
        header.initView(UIImage(named: "IMG_8040")!, username: self.posts[section].username, date: self.posts[section].date)
        return header
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    @IBAction func likeButtonPressed(sender: UIButton) {
        let isLike = self.posts[sender.tag].like.contains(self.user.username)
        
        if isLike {
            let index = self.posts[sender.tag].like.indexOf(self.user.username)
            self.posts[sender.tag].removeLikeAtIndex(index!)
            sender.setImage(UIImage(named: "heart_empty"), forState: .Normal)
        } else {
            self.posts[sender.tag].appendLike(self.user.username)
            sender.setImage(UIImage(named: "heart_full"), forState: .Normal)
        }
        
        likeLbls[sender.tag].text = "❤️\(self.posts[sender.tag].like.count)次赞"
    }
    
    @IBAction func commentButtonPressed(sender: UIButton) {
    }
    
    @IBAction func forwardButtonPressed(sender: UIButton) {
    }
    
    @IBAction func moreButtonPressed(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "ShowBottomMenu", object: sender.tag))
        
    }
    
    @IBAction func allCommentsButtonPressed(sender: UIButton) {
    }
    
    
    
}

