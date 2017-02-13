//
//  ButtonCell.swift
//  Weibo
//
//  Created by Ant on 3/26/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {

    @IBOutlet weak var img: RoundImageWithBorder!
    @IBOutlet weak var lbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(_ lbl: String, image: UIImage) {
        self.img.image = image
        self.lbl.text = lbl
    }

}
