//
//  LikeWithPicCell.swift
//  Instagram
//
//  Created by Ant on 4/4/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class LikeWithPicCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var notificationText: UITextView!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        notificationText.linkTextAttributes = [
            NSForegroundColorAttributeName: COLOR_BLUE
        ]
    }
    
    func initCell(notification: Notification) {
        self.avatar.image = notification.fromAvatar
        self.notificationText.attributedText = initText(notification.from, type: notification.type, to: notification.to, date: notification.date)
        self.img.image = notification.images[0]
    }
    
    func initText(from: String, type: String, to: String, date: String) -> NSMutableAttributedString {
        
        let result = NSMutableAttributedString(
            string: "\(from) liked \(to)'s photo. \(date)",
            attributes: [
                NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0)!
            ]
        )
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
            range: NSRange(location: from.characters.count + 7, length: to.characters.count)
        )
        
        return result
    }
}
