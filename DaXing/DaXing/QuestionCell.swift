//
//  QuestionCell.swift
//  DaXing
//
//  Created by Ant on 5/16/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var likeLbl: UILabel!
    @IBOutlet weak var forwardLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(title:String, price:String, like:String, forward:String) {
        self.titleLbl.text = title
        self.priceLbl.text = "￥"+price
        self.likeLbl.text = like
        self.forwardLbl.text = forward
        print("aa")
    }

    @IBAction func likeBtnPressed(sender: UIButton) {
    }
    @IBAction func forwardBtnPressed(sender: UIButton) {
    }
}
