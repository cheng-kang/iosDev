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
        
        self.longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(Test.longPressGestureRecognizerAction(_:)))
        self.collectionView.addGestureRecognizer(self.longPressGestureRecognizer)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TestCell
        cell.configureCell("\(indexPath.row)")
        if indexPath.section == 1 {
            cell.backgroundColor = UIColor.green
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width / 4, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
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
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        self.sections[destinationIndexPath.section] += 1
        self.sections[sourceIndexPath.section] -= 1
    }
    
    func longPressGestureRecognizerAction(_ sender: UILongPressGestureRecognizer) {
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
        case .began:
            guard let selectedIndexPath = self.collectionView.indexPathForItem(at: sender.location(in: self.collectionView)) else {
                break
            }
            self.collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
            break
        case .changed:
            self.collectionView.updateInteractiveMovementTargetPosition(sender.location(in: self.collectionView))
            break
        case .ended:
            self.collectionView.endInteractiveMovement()
        default:
            self.collectionView.cancelInteractiveMovement()
            break
        }
    }
    
}
