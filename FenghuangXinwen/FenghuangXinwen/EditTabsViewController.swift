//
//  EditTabsViewController.swift
//  FenghuangXinwen
//
//  Created by Ant on 4/13/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class EditTabsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var didEdited = false
    var longPressGestureRecognizer:UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressGestureRecognizerAction:")
        self.collectionView.addGestureRecognizer(self.longPressGestureRecognizer)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TabDataService.instance.tabData[section].count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TabCell", forIndexPath: indexPath) as! TabCell
        cell.configureCell(TabDataService.instance.tabData[indexPath.section][indexPath.row])
        if indexPath.row != 0 {
            cell.lbl.textColor = UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1)
            cell.markCellDeletable()
        } else {
            cell.lbl.textColor = UIColor.redColor()
        }
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.width / 4, 45)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "TabSectionHeader", forIndexPath: indexPath) as! TabSectionHeader
            
            header.title.text = "点击添加或订阅频道，拖动可进行频道排序"
            header.editBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
            header.editBtn.setTitle("完成", forState: .Normal)
            header.editBtn.addTarget(self, action: "completeBtnPressed:", forControlEvents: .TouchUpInside)
            
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "TabSectionFooter", forIndexPath: indexPath)
            return footer
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row != 0 {
            TabDataService.instance.appendToTabData(1,newElement: TabDataService.instance.tabData[0][indexPath.row])
            TabDataService.instance.removeFromTabDataAtIndex(0, index: indexPath.row)
            collectionView.deleteItemsAtIndexPaths([indexPath])
            
            self.didEdited = true
        }
    }
    
    func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let temp = TabDataService.instance.tabData[0][sourceIndexPath.row]
        TabDataService.instance.removeFromTabDataAtIndex(0, index: sourceIndexPath.row)
        TabDataService.instance.insertIntoTabDataAtIndex(0, newElement: temp, index: destinationIndexPath.row)
        
        self.didEdited = true
    }
    
    func longPressGestureRecognizerAction(sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .Began:
            guard let selectedIndexPath = self.collectionView.indexPathForItemAtPoint(sender.locationInView(self.collectionView)) else {
                break
            }
            if selectedIndexPath.row != 0 {
                self.collectionView.beginInteractiveMovementForItemAtIndexPath(selectedIndexPath)
            }
            break
        case .Changed:
            if self.collectionView.indexPathForItemAtPoint(sender.locationInView(self.collectionView))?.row != 0 {
                self.collectionView.updateInteractiveMovementTargetPosition(sender.locationInView(self.collectionView))
            }
            break
        case .Ended:
            self.collectionView.endInteractiveMovement()
            break
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    func completeBtnPressed(sender: UIButton) {
        if self.didEdited {
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "TabDataEdited", object: nil))
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
