//
//  TabsViewController.swift
//  FenghuangXinwen
//
//  Created by Ant on 4/13/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class TabsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var didEdited = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "tabDataEdited:", name: "TabDataEdited", object: nil)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return TabDataService.instance.tabData.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TabDataService.instance.tabData[section].count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TabCell", forIndexPath: indexPath) as! TabCell
        cell.configureCell(TabDataService.instance.tabData[indexPath.section][indexPath.row])
        
        cell.newImg.hidden = true
        
        if indexPath.section == 0 && indexPath.row == 0 {
            print(indexPath)
            cell.lbl.textColor = UIColor.redColor()
        } else {
            cell.lbl.textColor = UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1)
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.width / 4, 45)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "TabSectionHeader", forIndexPath: indexPath) as! TabSectionHeader
            
            if indexPath.section == 0 {
                header.title.text = "点击进入频道"
                header.editBtn.hidden = false
            } else {
                header.title.text = "更多频道"
                header.editBtn.hidden = true
                header.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
            }
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "TabSectionFooter", forIndexPath: indexPath)
            return footer
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            print("bbbbbbbbbbbbb")
            TabDataService.instance.insertIntoTabDataAtIndex(0, newElement: TabDataService.instance.tabData[1][indexPath.row], index: 4)
            TabDataService.instance.removeFromTabDataAtIndex(1, index: indexPath.row)
            collectionView.moveItemAtIndexPath(indexPath, toIndexPath: NSIndexPath(forRow: 4, inSection: 0))
            let cell = collectionView.cellForItemAtIndexPath(NSIndexPath(forRow: 4, inSection: 0)) as! TabCell
            cell.markCellNew()
            
            self.didEdited = true
        }
    }
    
    func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        print("aaaaaaaaaaaaaaa")
    }

    @IBAction func dismissBtnPressed(sender: UIButton) {
        if self.didEdited {
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "TabDataEdited", object: nil))
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tabDataEdited(sender: NSNotification) {
        self.didEdited = true
        self.collectionView.reloadData()
    }
}
