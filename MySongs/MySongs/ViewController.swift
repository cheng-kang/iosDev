//
//  ViewController.swift
//  MySongs
//
//  Created by Ant on 3/14/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        SongService.instance.loadSongs()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let song = SongService.instance.songs[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("SongCell") as? SongCell {
            cell.configureCell(song)
            return cell
        }else{
            let cell = SongCell()
            cell.configureCell(song)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SongService.instance.songs.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("goDetail", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goDetail" {
            if let detailVC = segue.destinationViewController as? DetailViewController {
                if let cellIndex = sender as? Int {
                    detailVC.cellIndex = cellIndex
                }
            }
        }
    }

}

