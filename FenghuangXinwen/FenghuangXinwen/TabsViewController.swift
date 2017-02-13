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
    
    var didEdit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(TabsViewController.tabDataEdited(_:)), name: NSNotification.Name(rawValue: "TabDataEdited"), object: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return TabDataService.instance.tabData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TabDataService.instance.tabData[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
        cell.configureCell(TabDataService.instance.tabData[indexPath.section][indexPath.row])
        
        cell.newImg.isHidden = true
        
        if indexPath.section == 0 && indexPath.row == 0 {
            print(indexPath)
            cell.lbl.textColor = UIColor.red
        } else {
            cell.lbl.textColor = UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TabSectionHeader", for: indexPath) as! TabSectionHeader
            
            if indexPath.section == 0 {
                header.title.text = "点击进入频道"
                header.editBtn.isHidden = false
            } else {
                header.title.text = "更多频道"
                header.editBtn.isHidden = true
                header.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
            }
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TabSectionFooter", for: indexPath)
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            print("bbbbbbbbbbbbb")
            TabDataService.instance.insertIntoTabDataAtIndex(0, newElement: TabDataService.instance.tabData[1][indexPath.row], index: 4)
            TabDataService.instance.removeFromTabDataAtIndex(1, index: indexPath.row)
            collectionView.moveItem(at: indexPath, to: IndexPath(row: 4, section: 0))
            let cell = collectionView.cellForItem(at: IndexPath(row: 4, section: 0)) as! TabCell
            cell.markCellNew()
            
            self.didEdit = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("aaaaaaaaaaaaaaa")
    }

    @IBAction func dismissBtnPressed(_ sender: UIButton) {
        if self.didEdit {
            NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "TabDataEdited"), object: nil))
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func tabDataEdited(_ sender: Notification) {
        self.didEdit = true
        self.collectionView.reloadData()
    }
}
