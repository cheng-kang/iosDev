//
//  TabCell.swift
//  FenghuangXinwen
//
//  Created by Ant on 4/13/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class TabCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: RoundedCornerRectView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var deleteImg: UIImageView!
    @IBOutlet weak var newImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.deleteImg.isHidden = true
        self.newImg.isHidden = true
        self.newImg.isHidden = true
        self.deleteImg.isHidden = true
    }
    
    func configureCell(_ title: String) {
        self.lbl.text = title
    }
    
    func markCellNew() {
        self.newImg.isHidden = false
    }
    
    func markCellDeletable() {
        self.deleteImg.isHidden = false
    }
    
}
