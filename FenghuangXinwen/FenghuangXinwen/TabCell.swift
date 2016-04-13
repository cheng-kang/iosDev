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
        
        self.deleteImg.hidden = true
        self.newImg.hidden = true
        self.newImg.hidden = true
        self.deleteImg.hidden = true
    }
    
    func configureCell(title: String) {
        self.lbl.text = title
    }
    
    func markCellNew() {
        self.newImg.hidden = false
    }
    
    func markCellDeletable() {
        self.deleteImg.hidden = false
    }
    
}
