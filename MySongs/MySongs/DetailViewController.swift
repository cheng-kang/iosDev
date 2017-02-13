//
//  DetailViewController.swift
//  MySongs
//
//  Created by Ant on 3/15/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var cellIndex: Int!

    @IBOutlet weak var songImg: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songSinger: UILabel!
    @IBOutlet weak var songLyric: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if cellIndex != nil {
            let song = SongService.instance.songs[cellIndex]
            songImg.image = song.getSongImage()
            songTitle.text = song.title
            songSinger.text = song.singer
            songLyric.text = song.lyric
        }
    }
}
