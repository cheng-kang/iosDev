//
//  Player.swift
//  DouDizhu
//
//  Created by Ant on 16/9/18.
//  Copyright © 2016年 Ant. All rights reserved.
//

import Foundation

class Player: NSObject {
    var id: String!
    var role: String!
    var hand = Hand()
    var cards: [String]! {
        didSet {
            var tempList = [Card]()
            for card in cards {
                let temp = Card(name: card)
                tempList.append(temp)
            }
            self.hand.cards = tempList
        }
    }
}
