//
//  SearchBarButtonView.swift
//  Weibo
//
//  Created by Ant on 3/27/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class SearchBarButtonView: UIView {

    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.img.image = UIImage(named: "search")!
        
        self.searchBar.layer.cornerRadius = 5
    }

    func configureView(_ bgColor: UIColor, barBgColor: UIColor, content: String) {
        self.backgroundColor = bgColor
        self.searchBar.backgroundColor = barBgColor
        self.content.text = content
    }
}
