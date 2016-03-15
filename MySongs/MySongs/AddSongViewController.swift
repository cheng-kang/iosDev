//
//  AddSongViewController.swift
//  MySongs
//
//  Created by Ant on 3/14/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class AddSongViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var songImg: UIImageView!
    @IBOutlet weak var songTitle: UITextField!
    @IBOutlet weak var songSinger: UITextField!
    @IBOutlet weak var songLyric: UITextView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songLyric.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 0.8).CGColor
        songLyric.layer.borderWidth = CGFloat(1.0)
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    @IBAction func selectPhotoButtonPressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func submitButtonPressed(sender: AnyObject) {
        if let image = songImg.image, let title = songTitle.text, let singer = songSinger.text, let lyric = songLyric.text {
            SongService.instance.addSong(image, title: title, singer: singer, lyric: lyric)
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.songImg.image = image
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
}
