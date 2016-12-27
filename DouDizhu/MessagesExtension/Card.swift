//
//  Card.swift
//  DouDizhu
//
//  Created by Ant on 16/9/14.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class Card: UIImageView {
    
    var isSelected = false {
        didSet {
            if isSelected != oldValue {
                if isSelected == false {
                    self.frame.origin.y += 20
                } else {
                    self.frame.origin.y -= 20
                }
            }
        }
    }
    
    var isShow = true {
        didSet {
            if isShow == false {
                self.image = backImage
            } else {
                self.image = frontImage
            }
        }
    }
    
    var frontImage: UIImage!
    var backImage = UIImage(named: "back")!
    
    var number: Int! {
        didSet {
            print(number)
        }
    }
    
    init(name: String) {
        let no = name.substring(from: name.index(after: name.startIndex))
        print(no)
        switch no {
        case "3":
            self.number = 3
            break
        case "4":
            self.number = 4
            break
        case "5":
            self.number = 5
            break
        case "6":
            self.number = 6
            break
        case "7":
            self.number = 7
            break
        case "8":
            self.number = 8
            break
        case "9":
            self.number = 9
            break
        case "10":
            self.number = 10
            break
        case "J":
            self.number = 11
            break
        case "Q":
            self.number = 12
            break
        case "K":
            self.number = 13
            break
        case "A":
            self.number = 14
            break
        case "2":
            self.number = 15
            break
        case "B":
            self.number = 16
            break
        case "R":
            self.number = 17
            break
        default:
            break
        }
        self.frontImage = UIImage(named: name)!
        super.init(image: frontImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
