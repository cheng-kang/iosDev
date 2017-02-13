//
//  PostCell.swift
//  Instagram
//
//  Created by Ant on 4/2/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var likeLbl: UILabel!
    @IBOutlet weak var comment1: UITextView!
    @IBOutlet weak var comment2: UITextView!
    @IBOutlet weak var comment3: UITextView!
    @IBOutlet weak var comment4: UITextView!
    @IBOutlet weak var buttonPanel: UIView!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var allCommentsBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        comment1.linkTextAttributes = [
            NSForegroundColorAttributeName: COLOR_BLUE
        ]
        comment2.linkTextAttributes = [
            NSForegroundColorAttributeName: COLOR_BLUE
        ]
        comment3.linkTextAttributes = [
            NSForegroundColorAttributeName: COLOR_BLUE
        ]
        comment4.linkTextAttributes = [
            NSForegroundColorAttributeName: COLOR_BLUE
        ]
        
        print(self.img.frame.height)
        print(self.img.frame.width)
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = COLOR_GREY.cgColor
        border.frame = CGRect(x: 0, y: self.buttonPanel.frame.height - width, width: self.buttonPanel.frame.width, height: self.buttonPanel.frame.height)
        border.borderWidth = width
        self.buttonPanel.layer.addSublayer(border)
        self.buttonPanel.layer.masksToBounds = true
    }
    
    func initCell(_ post: Post, sectionNumber: Int, currentUsername: String) {
        self.img.image = post.img
        self.likeLbl.text = "♥\(post.like.count)次赞"
        self.likeLbl.textColor = COLOR_BLUE
        let isLike = post.like.contains(currentUsername)
        self.likeBtn.setImage(UIImage(named: isLike ? "heart_full" : "heart_empty"), for: UIControlState())
        
        self.likeBtn.tag = sectionNumber
        self.commentBtn.tag = sectionNumber
        self.forwardBtn.tag = sectionNumber
        self.moreBtn.tag = sectionNumber
        self.allCommentsBtn.tag = sectionNumber
        
        comment1.attributedText = initText(post.comments[0])
        comment2.attributedText = initText(post.comments[1])
        comment3.attributedText = initText(post.comments[2])
        comment4.attributedText = initText(post.comments[3])
        
        
    }
    
    func initText(_ comment: [String]) -> NSMutableAttributedString {
        
        let result = NSMutableAttributedString(
            string: comment[1]+" "+comment[0],
            attributes: [
                NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0)!
            ]
        )
        
        result.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 12.0)!, range: NSRange(location: 0, length: comment[1].characters.count))
        result.addAttributes(
            [
               NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 12.0)!,
                NSLinkAttributeName: URL(string: "user://\(comment[1])")!,
            ],
            range: NSRange(location: 0, length: comment[1].characters.count)
        )
        
        return result
    }
}
