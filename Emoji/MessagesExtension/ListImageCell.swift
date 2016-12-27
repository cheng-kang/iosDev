//
//  ListImageCell.swift
//  Emoji
//
//  Created by Ant on 16/9/16.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class ListImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String! {
        didSet {
            self.imageView.image = UIImage(named: imageName)!
        }
    }
    
    var lp: (()->())!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let lp = UILongPressGestureRecognizer(target: self, action: #selector(ListImageCell.handleLongPress))
//        self.imageView.addGestureRecognizer(lp)
    }
    
    func handleLongPress() {
        lp()
    }
}
