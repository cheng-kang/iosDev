//
//  PostHeader.swift
//  Instagram
//
//  Created by Ant on 4/3/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class PostHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var avatar: RoundImage!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.username.textColor = COLOR_BLUE
    }
    
    func initView(_ avatar: UIImage, username: String, date: String) {
        self.avatar.image = avatar
        self.username.text = username
        self.date.text = date
    }
    
}
