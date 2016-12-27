//
//  GameViewController.swift
//  DouDizhu
//
//  Created by Ant on 16/9/18.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit
import Wilddog

class GameViewController: UIViewController {
    
    static let storyboardIdentifier = "GameViewController"
    
    var game: DouDiZhu! {
        didSet {
            let temp = Player()
            
            if let role = UserDefaults.standard.string(forKey: "role") {
                temp.role = role
            } else {
                switch game.playersInGame {
                case 0:
                    temp.role = "A"
                case 1:
                    temp.role = "B"
                case 2:
                    temp.role = "C"
                default:
                    // error
                    break
                }
                
                UserDefaults.standard.set(temp.role, forKey: "role")
                UserDefaults.standard.synchronize()
            }
            
            switch temp.role {
            case "A":
                player.cards = game.cardsA
            case "B":
                player.cards = game.cardsB
            case "C":
                player.cards = game.cardsC
            default:
                // error
                break
            }
            
            player = temp
            hasDizhu = game.Dizhu != ""
        }
    }
    var player: Player!
    
    var hasDizhu: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setCurrentUI() {
        
        // set current player hand
        let hand = player.hand
        
        // calculate card margin by card count
        let l = (self.view.frame.width - DECK_X * 2) - CARD_WIDTH
        let n = player.cards.count - 1
        let CARD_MARGIN = l/CGFloat(n)
        
        for i in 0..<hand.cards.count {
            let card = hand.cards[i]
            
            card.frame = CGRect(x: DECK_X + CGFloat(i)*CARD_MARGIN, y: DECK_Y, width: CARD_WIDTH, height: CARD_HEIGHT)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.pickCard(sender:)))
            card.addGestureRecognizer(tapGesture)
            card.isUserInteractionEnabled = true
            
            self.view.addSubview(card)
        }
        
        // set cards for Dizhu
        if !hasDizhu {
            for i in 0..<game.cardsD.count {
                let card = Card(name: game.cardsD[i])
                
                // cards for Dizhu isShow default: false
                card.isShow = false
                
                card.frame = CGRect(x: DIZHU_X + CGFloat(i)*DIZHU_CARD_MARGIN, y: DIZHU_Y, width: CARD_WIDTH, height: CARD_HEIGHT)
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.pickCard(sender:)))
                card.addGestureRecognizer(tapGesture)
                card.isUserInteractionEnabled = true
                
                self.view.addSubview(card)
            }
            
        }
    }
    
    func pickCard(sender: UITapGestureRecognizer) {
        let card = sender.view as! Card
        card.isSelected = !card.isSelected
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
