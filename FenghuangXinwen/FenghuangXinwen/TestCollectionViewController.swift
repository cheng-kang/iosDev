//
//  TestCollectionViewController.swift
//  FenghuangXinwen
//
//  Created by Ant on 4/12/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TestCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self

        // Do any additional setup after loading the view.
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 30
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AAA", forIndexPath: indexPath) as! TestCell
        cell.configureCell("\(indexPath.section)")
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
//        let temp = numbers.removeAtIndex(sourceIndexPath.item)
//        numbers.insert(temp, atIndex: destinationIndexPath.item)
    }

}
