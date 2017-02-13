//
//  TestCell.swift
//  FenghuangXinwen
//
//  Created by Ant on 4/12/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class TestCell: UICollectionViewCell {
    
    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ lbl: String) {
        self.lbl.text = lbl
    }
}
