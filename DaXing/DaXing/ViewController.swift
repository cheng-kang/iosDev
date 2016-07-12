//
//  ViewController.swift
//  DaXing
//
//  Created by Ant on 5/16/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var questions = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.loadQuestionData()
    }
    
    func loadQuestionData() {
        let data = NSData(contentsOfURL: NSURL(string: "http://112.74.110.244/slim/questions/715")!)
        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        do {
            
            let questions = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
            print(questions)
            self.questions.removeAll()
//            for i in 0 ..< questions.count {
//                let question = [
//                    "title": questions[i]["title"] as! String,
//                    "price": questions[i]["price"] as! String,
//                    "like": questions[i]["follow_count"] as! String,
//                    "forward": questions[i]["answer_count"] as! String
//                ]
//                self.questions.append(question)
//            }
            print(questions[0]["receiverUserId"])
            
        } catch let error as NSError {
            print(error)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell") as! QuestionCell
        cell.configureCell(self.questions[indexPath.row]["title"]!, price: self.questions[indexPath.row]["price"]!, like: self.questions[indexPath.row]["like"]!, forward: self.questions[indexPath.row]["forward"]!)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }
    


}

