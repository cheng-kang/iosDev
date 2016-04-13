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

    var sections = [15,15]
    var originalSectionIndex = 0
    var interactiveItem:UICollectionViewCell!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressGestureRecognizerAction:")
        self.collectionView.addGestureRecognizer(self.longPressGestureRecognizer)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! TestCell
        cell.configureCell("\(indexPath.row)")
        if indexPath.section == 1 {
            cell.backgroundColor = UIColor.greenColor()
        }
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section]
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.collectionView.frame.width / 4, 20)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
//        if indexPath.section == 1 {
//            self.s1++
//            self.s2--
//            let ip = NSIndexPath(forRow: 4, inSection: 0)
//            self.collectionView.moveItemAtIndexPath(indexPath, toIndexPath: ip)
//        } else {
//            print("111")
//            self.collectionView.beginInteractiveMovementForItemAtIndexPath(indexPath)
//        }
    }
    
    func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        self.sections[destinationIndexPath.section]++
        self.sections[sourceIndexPath.section]--
    }
    
    func longPressGestureRecognizerAction(sender: UILongPressGestureRecognizer) {
//        switch sender.state {
//        case .Began:
//            let location = sender.locationInView(self.collectionView)
//            let indexPath = self.collectionView.indexPathForItemAtPoint(location)
//            self.originalSectionIndex = (indexPath?.section)!
//            self.interactiveItem = self.collectionView.cellForItemAtIndexPath(indexPath!)
//            self.collectionView.beginInteractiveMovementForItemAtIndexPath(indexPath!)
//            break
//        case .Changed:
//            let location = sender.locationInView(self.collectionView)
//            print(location)
//            let indexPath = self.collectionView.indexPathForItemAtPoint(location)
//            print(indexPath)
//            self.collectionView.updateInteractiveMovementTargetPosition(location)
//        case .Ended:
//            self.collectionView.endInteractiveMovement()
//            let currentSectionIndex = (self.collectionView.indexPathForCell(self.interactiveItem)?.section)!
//            self.sections[currentSectionIndex]++
//            self.sections[self.originalSectionIndex]--
//        default:
//            self.collectionView.cancelInteractiveMovement()
//            break
//        }
    
        switch sender.state {
        case .Began:
            guard let selectedIndexPath = self.collectionView.indexPathForItemAtPoint(sender.locationInView(self.collectionView)) else {
                break
            }
            self.collectionView.beginInteractiveMovementForItemAtIndexPath(selectedIndexPath)
            break
        case .Changed:
            self.collectionView.updateInteractiveMovementTargetPosition(sender.locationInView(self.collectionView))
            break
        case .Ended:
            self.collectionView.endInteractiveMovement()
        default:
            self.collectionView.cancelInteractiveMovement()
            break
        }
    }
    
}
