//
//  Test.swift
//  FenghuangXinwen
//
//  Created by Ant on 4/11/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit
import Foundation

class Test: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var s1 = 20
    var s2 = 20
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! TestCell
        cell.initCell("\(indexPath.row)")
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return s1
        } else {
            return s2
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.collectionView.frame.width / 4, 20)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            self.s1++
            self.s2--
            let ip = NSIndexPath(forRow: 4, inSection: 0)
            self.collectionView.moveItemAtIndexPath(indexPath, toIndexPath: ip)
        }
    }
}
