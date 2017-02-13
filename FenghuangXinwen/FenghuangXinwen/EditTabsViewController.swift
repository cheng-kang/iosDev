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
    
    var didEdit = false
    var longPressGestureRecognizer:UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(EditTabsViewController.longPressGestureRecognizerAction(_:)))
        self.collectionView.addGestureRecognizer(self.longPressGestureRecognizer)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TabDataService.instance.tabData[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
        cell.configureCell(TabDataService.instance.tabData[indexPath.section][indexPath.row])
        if indexPath.row != 0 {
            cell.lbl.textColor = UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1)
            cell.markCellDeletable()
        } else {
            cell.lbl.textColor = UIColor.red
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TabSectionHeader", for: indexPath) as! TabSectionHeader
            
            header.title.text = "点击添加或订阅频道，拖动可进行频道排序"
            header.editBtn.setTitleColor(UIColor.red, for: UIControlState())
            header.editBtn.setTitle("完成", for: UIControlState())
            header.editBtn.addTarget(self, action: #selector(EditTabsViewController.completeBtnPressed(_:)), for: .touchUpInside)
            
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TabSectionFooter", for: indexPath)
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            TabDataService.instance.appendToTabData(1,newElement: TabDataService.instance.tabData[0][indexPath.row])
            TabDataService.instance.removeFromTabDataAtIndex(0, index: indexPath.row)
            collectionView.deleteItems(at: [indexPath])
            
            self.didEdit = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = TabDataService.instance.tabData[0][sourceIndexPath.row]
        TabDataService.instance.removeFromTabDataAtIndex(0, index: sourceIndexPath.row)
        TabDataService.instance.insertIntoTabDataAtIndex(0, newElement: temp, index: destinationIndexPath.row)
        
        self.didEdit = true
    }
    
    func longPressGestureRecognizerAction(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began:
            guard let selectedIndexPath = self.collectionView.indexPathForItem(at: sender.location(in: self.collectionView)) else {
                break
            }
            if selectedIndexPath.row != 0 {
                self.collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
            }
            break
        case .changed:
            if self.collectionView.indexPathForItem(at: sender.location(in: self.collectionView))?.row != 0 {
                self.collectionView.updateInteractiveMovementTargetPosition(sender.location(in: self.collectionView))
            }
            break
        case .ended:
            self.collectionView.endInteractiveMovement()
            break
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    func completeBtnPressed(_ sender: UIButton) {
        if self.didEdit {
            NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "TabDataEdited"), object: nil))
        }
        
        dismiss(animated: true, completion: nil)
    }
}
