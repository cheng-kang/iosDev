//
//  AddPostViewController.swift
//  MyHood
//
//  Created by Ant on 3/14/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postDesc: UITextView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

    @IBAction func selectPhotoButtonPressed(_ sender: UIButton) {
        sender.setTitle("edit", for: UIControlState())
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func postNowButtonPressed(_ sender: UIButton) {
        if let title = postTitle.text, let desc = postDesc.text, let img = postImg.image {
            let imgPath = PostService.instance.saveImageAndCreatePath(img)
            let post = Post(postImg: imgPath, postTitle: title, postDesc: desc)
            PostService.instance.addPost(post)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelPost(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismiss(animated: true, completion: nil)
        postImg.image = image
    }
    
}
