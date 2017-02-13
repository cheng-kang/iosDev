//
//  BarCell.swift
//  Weibo
//
//  Created by Ant on 3/27/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class BarCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var redCircle: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        
    }
    
    func initCell(_ image: UIImage, title: String, subtitle: String, new: Bool) {
        self.img.image = image
        self.title.text = title
        self.title.frame.size.width = self.title.frame.size.width / 2
        self.subtitle.text = subtitle
        
//        self.redCircle.hidden = !new
        if new {
            self.redCircle.image = UIImage(named: "red_circle")
            self.redCircle.frame.size = CGSize(width: 6, height: 6)
        } else {
            self.redCircle.image = UIImage(named: "arrow_right")
            self.redCircle.frame.size = CGSize(width: 6, height: 12)
        }
    }

}
