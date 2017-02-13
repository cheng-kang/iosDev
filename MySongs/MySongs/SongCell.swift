//
//  SongCell.swift
//  MySongs
//
//  Created by Ant on 3/14/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var cellImg: UIImageView!
    
    override func awakeFromNib() {
        
    }
    
    func configureCell(_ song: Song) {
        cellLbl.text = song.songLabel
        cellImg.image = song.getSongImage()
    }
}
