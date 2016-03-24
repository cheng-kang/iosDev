//
//  TableViewCell.swift
//  estimatedRowHeightTest
//
//  Created by Ant on 3/23/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func initCell() {
        firstLbl.text = "好多文字啊。好多文字啊。好多文字啊。好多文字啊。好多文字啊。好多文字啊。好多文字啊。好多文字啊。好多文字啊。好多文字啊。好多文字啊。好多文字啊。"
        secondLbl.text = "标题标题"
    }
    

}
