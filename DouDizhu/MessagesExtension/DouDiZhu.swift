//
//  Game.swift
//  DouDizhu
//
//  Created by Ant on 16/9/18.
//  Copyright © 2016年 Ant. All rights reserved.
//

import Foundation
import Messages

class DouDiZhu: NSObject {
    var gameId: String!
    var A: Int = 0
    var B: Int = 0
    var C:Int = 0
    var D:Int = 0 // 0, when D == 3 and Dizhu == "", restart game
    var Dizhu: String = ""
    var dealTypeIndex: Int = 0
    var remainCardCountIndex: Int = 0
    var winTypeIndex: Int = 0
    var deckCount: Int = 0
    var cardsA: [String] = []
    var cardsB: [String] = []
    var cardsC: [String] = []
    var cardsD: [String] = []
    var playersInGame: Int = 0
    
    var history: [String] = [] // Type.Role.Card.Card.Card...
                               // Type: [QIANG, BUQIANG, BUYAO, CHUPAI, FANGUI, SHENGLI]
    
}
