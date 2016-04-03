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
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: "PostHeaderView", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "PostHeaderView")
        
        let post = Post(username: "CHENGKANG", img: UIImage(named: "test")!, like: 13720, comments: [
        ["WOWOWOW!!!", "persona"],
        ["I LOVE YOU!!!", "personb"],
        ["This is a long comment for testing purpose. I don't know what i can input here so just some nonsense. It's not long engough, i'll keep typing until i'm satisfied. I think it's about engough. :D.", "personc"],
        ["this is another one", "persond"],
        ["Thank you!", "CHENGKANG"],
        ], date: "3天前")
        
        self.posts.append(post)
        self.posts.append(post)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        cell.initCell(self.posts[indexPath.section])
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
}

