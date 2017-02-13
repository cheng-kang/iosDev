//
//  ViewController.swift
//  MyHood
//
//  Created by Ant on 3/14/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.delegate = self
        postTableView.dataSource = self
        
        PostService.instance.loadPosts()
        
        NotificationCenter.default.addObserver(self, selector: "onPostLoaded", name: NSNotification.Name(rawValue: "postLoaded"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.postTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = PostService.instance.loadedPosts[indexPath.row]
        
        if let cell = postTableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        }else{
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostService.instance.loadedPosts.count
    }
    
    func onPostLoaded(_ notif: AnyObject) {
        postTableView.reloadData()
    }
}

