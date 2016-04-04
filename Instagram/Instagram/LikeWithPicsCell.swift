//
//  LikeWithPicsCell.swift
//  Instagram
//
//  Created by Ant on 4/4/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class LikeWithPicsCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var notificationText: UITextView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    @IBOutlet weak var img10: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        notificationText.linkTextAttributes = [
            NSForegroundColorAttributeName: COLOR_BLUE
        ]
    }
    
    func initCell(notification: Notification) {
        self.avatar.image = notification.fromAvatar
        self.notificationText.attributedText = initText(notification.from, type: notification.type, to: notification.to, imgCount: notification.images.count, date: notification.date)
        
        let imageCount = notification.images.count
        let defaultImage = UIImage(named: "test")
        //此处逻辑需改进
        self.img1.image = imageCount > 0 ? notification.images[0] : defaultImage
        self.img2.image = imageCount > 1 ? notification.images[1] : defaultImage
        self.img3.image = imageCount > 2 ? notification.images[2] : defaultImage
        self.img4.image = imageCount > 3 ? notification.images[3] : defaultImage
        self.img5.image = imageCount > 4 ? notification.images[4] : defaultImage
        self.img6.image = imageCount > 5 ? notification.images[5] : defaultImage
        self.img7.image = imageCount > 6 ? notification.images[6] : defaultImage
        self.img8.image = imageCount > 7 ? notification.images[7] : defaultImage
        self.img9.image = imageCount > 8 ? notification.images[8] : defaultImage
        self.img10.image = imageCount > 9 ? notification.images[9] : defaultImage
    }
    
    func initText(from: String, type: String, to: String, imgCount: Int, date: String) -> NSMutableAttributedString {
        
        let text = to == "" ? "\(from) liked \(imgCount) photos. \(date)" : "\(from) liked \(imgCount) of \(to)'s photos. \(date)"
        
        let result = NSMutableAttributedString(
            string: text,
            attributes: [
                NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0)!
            ]
        )
        
        if to == "" {
            result.addAttributes(
                [
                    NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 12.0)!,
                    NSLinkAttributeName: NSURL(string: "user://\(from)")!,
                ],
                range: NSRange(location: 0, length: from.characters.count)
            )
        } else {
            result.addAttributes(
                [
                    NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 12.0)!,
                    NSLinkAttributeName: NSURL(string: "user://\(from)")!,
                ],
                range: NSRange(location: 0, length: from.characters.count)
            )
            result.addAttributes(
                [
                    NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 12.0)!,
                    NSLinkAttributeName: NSURL(string: "user://\(to)")!,
                ],
                range: NSRange(location: from.characters.count + 7 + String(imgCount).characters.count + 4, length: to.characters.count)
            )
        }
        return result
    }
}
