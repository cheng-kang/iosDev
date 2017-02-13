//
//  MsgCell.swift
//  Weibo
//
//  Created by Ant on 3/26/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class MsgCell: UITableViewCell {

    @IBOutlet weak var img: RoundImageWithBorder!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var msgLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(_ image: UIImage, name: String, msg: String, date: String) {
        self.img.image = image
        self.nameLbl.text = name
        self.msgLbl.text = msg
        self.dateLbl.text = date
    }

}
