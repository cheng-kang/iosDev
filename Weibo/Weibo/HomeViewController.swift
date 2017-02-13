//
//  FirstViewController.swift
//  Weibo
//
//  Created by Ant on 3/19/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchBarView: SearchBarButtonView!
    var weibo = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBarView.configureView(COLOR_LIGHT_GREY ,barBgColor: UIColor.white, content: "大家正在搜：谁是世界上最帅的人")
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        for subView in searchBar.subviews  {
//            for subsubView in subView.subviews  {
//                if let bg = subsubView as? UIView {
//                    bg.layer.borderColor = COLOR_LIGHT_GREY.cgcOLOR
//                    bg.layer.borderWidth = 1
//                }
//                if let textField = subsubView as? UITextField {
////                    textField.layer.borderWidth = 0
//                }
//            }
//        }
//        searchBar.barTintColor = COLOR_LIGHT_GREY
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.initCell(indexPath.row)
            
            let tapToForward = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.goToForwardPost(_:)))
            cell.buttonPanel.firstButtonView.addGestureRecognizer(tapToForward)
            let tapToComment = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.goToCommentPost(_:)))
            cell.buttonPanel.secondeButtonView.addGestureRecognizer(tapToComment)
            
            return cell
        } else {
            let cell = PostCell()
            cell.initCell(indexPath.row)
            return cell
        }
    }
    
    func goToForwardPost(_ tagGesture: UITapGestureRecognizer) {
        
        let tapLocation = tagGesture.location(in: self.tableView)
        let indexPath: IndexPath = self.tableView.indexPathForRow(at: tapLocation)!
        
        print(indexPath.row)
        
        performSegue(withIdentifier: "GoToForwardPost", sender: nil)
    }
    
    func goToCommentPost(_ tagGesture: UITapGestureRecognizer) {
        
        let tapLocation = tagGesture.location(in: self.tableView)
        let indexPath: IndexPath = self.tableView.indexPathForRow(at: tapLocation)!
        
        print(indexPath.row)
        
        performSegue(withIdentifier: "GoToCommentPost", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    @IBAction func goToForwardBox(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "GoToForwardBox", sender: nil)
    }
    @IBAction func goToCommentBox(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "GoToCommentBox", sender: nil)
    }
    

}

