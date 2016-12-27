//
//  Hand.swift
//  DouDizhu
//
//  Created by Ant on 16/9/14.
//  Copyright © 2016年 Ant. All rights reserved.
//

import Foundation
import UIKit

class Hand: NSObject {
    var cards:[Card]! {
        didSet {
            cards = cards.sorted(by: { (card1, card2) -> Bool in
                return card1.number < card2.number
            })
        }
    }
}
