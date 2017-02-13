//
//  ExplorePostCell.swift
//  Instagram
//
//  Created by Ant on 4/6/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class ExplorePostCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initCell(_ image: UIImage!) {
        self.img.image = image
    }
}
