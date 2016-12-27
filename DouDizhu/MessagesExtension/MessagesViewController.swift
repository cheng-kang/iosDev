//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Ant on 16/9/13.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit
import Messages
import Wilddog

class MessagesViewController: MSMessagesAppViewController {
    
    @IBOutlet weak var JiaoDizhuBtn: UIButton!
    @IBOutlet weak var QiangDizhuBtn: UIButton!
    @IBOutlet weak var BuJiaoBtn: UIButton!
    @IBOutlet weak var BuQiangBtn: UIButton!
    @IBOutlet weak var ChuPaiBtn: UIButton!
    @IBOutlet weak var GuoBtn: UIButton!
    @IBOutlet weak var KaiYiJuBtn: UIButton!
    
    @IBOutlet weak var DeckCountLbl: UILabel!
    @IBOutlet weak var RemainCardCountLbl: UILabel!
    @IBOutlet weak var DealTypeLbl: UILabel!
    @IBOutlet weak var WinTypeLbl: UILabel!
    
    @IBOutlet weak var DeckCountIncreseBtn: UIButton!
    @IBOutlet weak var DeckCountDecreseBtn: UIButton!
    @IBOutlet weak var RemainCardCountPrevBtn: UIButton!
    @IBOutlet weak var RemainCardCountNextBtn: UIButton!
    @IBOutlet weak var DealTypePrevBtn: UIButton!
    @IBOutlet weak var DealTypeNextBtn: UIButton!
    @IBOutlet weak var WinTypePrevBtn: UIButton!
    @IBOutlet weak var WinTypeNextBtn: UIButton!
    
    
    var deckCount: Int = 1 {
        didSet {
            DeckCountLbl.text = "\(deckCount)"
            
            if self.deckCount == 1 {
                self.DeckCountDecreseBtn.isEnabled = false
            } else {
                self.DeckCountDecreseBtn.isEnabled = true
            }
        }
    }
    var remainCardCountIndex: Int = 1 {
        didSet {
            RemainCardCountLbl.text = "\(remainCardCount[remainCardCountIndex])"
            
            if self.remainCardCountIndex == 0 {
                self.RemainCardCountPrevBtn.isEnabled = false
            } else {
                self.RemainCardCountPrevBtn.isEnabled = true
            }
            
            if self.remainCardCountIndex == self.remainCardCount.count - 1 {
                self.RemainCardCountNextBtn.isEnabled = false
            } else {
                self.RemainCardCountNextBtn.isEnabled = true
            }
        }
    }
    var dealTypeIndex: Int = 0 {
        didSet {
            DealTypeLbl.text = dealType[dealTypeIndex]
            
            if self.dealTypeIndex == 0 {
                self.DealTypePrevBtn.isEnabled = false
            } else {
                self.DealTypePrevBtn.isEnabled = true
            }
            
            if self.dealTypeIndex == self.dealType.count - 1 {
                self.DealTypeNextBtn.isEnabled = false
            } else {
                self.DealTypeNextBtn.isEnabled = true
            }
        }
    }
    var winTypeIndex: Int = 0 {
        didSet {
            WinTypeLbl.text = winType[winTypeIndex]
            
            if self.winTypeIndex == 0 {
                self.WinTypePrevBtn.isEnabled = false
            } else {
                self.WinTypePrevBtn.isEnabled = true
            }
            
            if self.winTypeIndex == self.dealType.count - 1 {
                self.WinTypeNextBtn.isEnabled = false
            } else {
                self.WinTypeNextBtn.isEnabled = true
            }
        }
    }
    
    var remainCardCount = [0, 3]
    var dealType = ["均分", "其他"]
    var winType = ["先出完", "其他"]
    
    var gameId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInitUI()
    }
    
    func setInitUI() {
        self.deckCount = 1
        self.remainCardCountIndex = 1
        self.dealTypeIndex = 0
        self.winTypeIndex = 0
    }
    
    
    func setInitGameUI(cardsForPlayer: [Card], cardsForDizhu: [Card]) {
        
        // set current player hand
        let hand = Hand()
        hand.cards = cardsForPlayer
        
        // calculate card margin by card count
        let l = (self.view.frame.width - DECK_X * 2) - CARD_WIDTH
        let n = cardsForPlayer.count - 1
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
        for i in 0..<cardsForDizhu.count {
            let card = cardsForDizhu[i]
            
            // cards for Dizhu isShow default: false
            card.isShow = false
            
            card.frame = CGRect(x: DIZHU_X + CGFloat(i)*DIZHU_CARD_MARGIN, y: DIZHU_Y, width: CARD_WIDTH, height: CARD_HEIGHT)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.pickCard(sender:)))
            card.addGestureRecognizer(tapGesture)
            card.isUserInteractionEnabled = true
            
            self.view.addSubview(card)
        }
        
        // set QiangDizhu Btn
        if remainCardCount[remainCardCountIndex] != 0 {
            self.JiaoDizhuBtn.isHidden = false
            self.BuJiaoBtn.isHidden = false
            self.JiaoDizhuBtn.frame = CGRect(x: 150, y: 45, width: 45, height: 30)
            self.BuJiaoBtn.frame = CGRect(x: 200, y: 45, width: 45, height: 30)
        }
    }
    
    
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
        
        //初始化 WDGApp
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
        guard let conversation = activeConversation else { fatalError("Expected a conversation") }
        
        if let message = conversation.selectedMessage {
            startGame(game: initGameWithMessage(message))
        } else {
            startGame(game: initNewGame())
        }
        
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

    
    @IBAction func JiaoDizhu(_ sender: UIButton) {
        let game = WDGSync.sync().reference().child("game").child(gameId!)
        game.updateChildValues(["A":1, "players":1]) { (error, gameRef) in
            if error != nil {
                print(error)
                return
            } else {
                
                var components = URLComponents()
                
                var queryItems = [URLQueryItem]()
                queryItems.append(URLQueryItem(name: "lastFrom", value: "A"))
                
                components.queryItems = queryItems
                
                let layout = MSMessageTemplateLayout()
                layout.image = UIImage(named: "back")
                layout.caption = "抢地主！"
                
                let message = MSMessage(session: self.activeConversation?.selectedMessage?.session ?? MSSession())
                message.url = components.url!
                message.layout = layout
                
                self.activeConversation?.insert(message, completionHandler: { (error) in
                    if error != nil {
                        print("error")
                        return
                    } else {
                        
                    }
                })
            }
        }
    }
    
    @IBAction func QiangDizhu(_ sender: UIButton) {
    }
    
    @IBAction func BuJiao(_ sender: UIButton) {
    }
    
    @IBAction func BuQiang(_ sender: UIButton) {
    }
    
    @IBAction func ChuPai(_ sender: UIButton) {
    }
    
    @IBAction func Guo(_ sender: UIButton) {
    }
    
    @IBAction func KaiYiJu(_ sender: UIButton) {
        self.KaiYiJuBtn.isHidden = true
//        initGame()
    }
    
    
    @IBAction func deckCountIncrese(_ sender: UIButton) {
        self.deckCount += 1
    }
    
    @IBAction func deckCountDecrese(_ sender: UIButton) {
        self.deckCount -= 1
    }
    
    @IBAction func remainCardCountIncrese(_ sender: UIButton) {
        self.remainCardCountIndex += 1
    }
    
    @IBAction func remainCardCountDecrese(_ sender: UIButton) {
        self.remainCardCountIndex -= 1
    }
    
    @IBAction func dealTypePrev(_ sender: UIButton) {
        self.dealTypeIndex -= 1
    }
    
    @IBAction func dealTypeNext(_ sender: UIButton) {
        self.dealTypeIndex += 1
    }
    
    @IBAction func winTypePrev(_ sender: UIButton) {
        self.winTypeIndex -= 1
    }
    
    @IBAction func winTypeNext(_ sender: UIButton) {
        self.winTypeIndex += 1
    }
}

extension MessagesViewController {
    
    func startGame(game: DouDiZhu) {
        
        guard let controller = storyboard?.instantiateViewController(withIdentifier: GameViewController.storyboardIdentifier) as? GameViewController else { fatalError("Unable to instantiate an IceCreamsViewController from the storyboard")
        }
        
        controller.game = game
        
        self.present(controller, animated: true, completion: {
        })
    }
    
    func initNewGame() -> DouDiZhu {
        // get a new suit
        var newSuit = [String]()
        newSuit.append(contentsOf: SUIT)
        
        // shuffle 3 times
        for _ in 1...3 {
            newSuit.shuffle()
        }
        
        // deal cards to 3 players: A, B, C
        var cardsForA = [String]()
        var cardsForB = [String]()
        var cardsForC = [String]()
        
        for i in stride(from: 0, to: newSuit.count - remainCardCount[remainCardCountIndex], by: 3) {
            cardsForA.append(newSuit[i])
            
            if (i+1)<=(newSuit.count - remainCardCount[remainCardCountIndex]) {
                cardsForB.append(newSuit[i+1])
            }
            
            if (i+2)<=(newSuit.count - remainCardCount[remainCardCountIndex]) {
                cardsForC.append(newSuit[i+2])
            }
        }
        
        // set cards for Dizhu
        var cardsForD = [String]()
        for i in (newSuit.count - remainCardCount[remainCardCountIndex])..<newSuit.count {
            cardsForD.append(newSuit[i])
        }
        
        if let playerId = UserDefaults.standard.string(forKey: "playerId") {
            print("PlayerId is: \(playerId)")
        } else {
            UserDefaults.standard.set("Abbbb", forKey: "playerId")
            
            if UserDefaults.standard.synchronize() {
                print("Saved")
            } else {
                print("Fail")
            }
        }
        
        let temp = DouDiZhu()
        
        temp.gameId = String(NSDate().timeIntervalSince1970)
        
        temp.deckCount = deckCount
        temp.remainCardCountIndex = remainCardCountIndex
        temp.dealTypeIndex = dealTypeIndex
        temp.winTypeIndex = winTypeIndex
        temp.cardsA = cardsForA
        temp.cardsB = cardsForB
        temp.cardsC = cardsForC
        temp.cardsD = cardsForD
        
        UserDefaults.standard.set("A", forKey: "role")
        UserDefaults.standard.set(temp.gameId, forKey: "game")
        
        if UserDefaults.standard.synchronize() {
            print("Saved")
        } else {
            fatalError("UserDefaults Synchronize Fail")
        }
        
        return temp
    }
    
    func initGameWithMessage(_ message: MSMessage) -> DouDiZhu {
        let temp = DouDiZhu()
        
        guard let components = NSURLComponents(url: (message.url)!, resolvingAgainstBaseURL: false) else {
            fatalError("The message contains an invalid URL")
        }
        
        if let queryItems = components.queryItems {
            // process the query items here...
            for item in queryItems {
                switch item.name {
                case "A":
                    temp.A = Int(item.value!)!
                case "B":
                    temp.B = Int(item.value!)!
                case "C":
                    temp.C = Int(item.value!)!
                case "D":
                    temp.D = Int(item.value!)!
                case "Dizhu":
                    temp.Dizhu = item.value!
                case "dealTypeIndex":
                    temp.dealTypeIndex = Int(item.value!)!
                case "remainCardCountIndex":
                    temp.remainCardCountIndex = Int(item.value!)!
                case "winTypeIndex":
                    temp.winTypeIndex = Int(item.value!)!
                case "deckCount":
                    temp.deckCount = Int(item.value!)!
                case "playersInGame":
                    temp.playersInGame = Int(item.value!)!
                case "cardsA":
                    let tempString = item.value!
                    temp.cardsA = tempString.components(separatedBy: "-")
                case "cardsB":
                    let tempString = item.value!
                    temp.cardsB = tempString.components(separatedBy: "-")
                case "cardsC":
                    let tempString = item.value!
                    temp.cardsC = tempString.components(separatedBy: "-")
                case "cardsD":
                    let tempString = item.value!
                    temp.cardsD = tempString.components(separatedBy: "-")
                case "history":
                    let tempString = item.value!
                    temp.history = tempString.components(separatedBy: "-")
                default:
                    break
                }
            }
        }
        
        return temp
    }
    
    func composeMessage(game: DouDiZhu, session: MSSession? = nil) -> MSMessage {
        
        guard let conversation = activeConversation else { fatalError("Expected a conversation") }
        
        let components = NSURLComponents()
        
        let A = URLQueryItem(name: "A", value: "\(game.A)")
        let B = URLQueryItem(name: "B", value: "\(game.B)")
        let C = URLQueryItem(name: "C", value: "\(game.C)")
        let D = URLQueryItem(name: "D", value: "\(game.D)")
        let Dizhu = URLQueryItem(name: "Dizhu", value: game.Dizhu)
        let dealTypeIndex = URLQueryItem(name: "dealTypeIndex", value: "\(game.dealTypeIndex)")
        let remainCardCountIndex = URLQueryItem(name: "remainCardCountIndex", value: "\(game.remainCardCountIndex)")
        let winTypeIndex = URLQueryItem(name: "winTypeIndex", value: "\(game.winTypeIndex)")
        let deckCount = URLQueryItem(name: "deckCount", value: "\(game.deckCount)")
        let playersInGame = URLQueryItem(name: "playersInGame", value: "\(game.playersInGame)")
        
        let cardsAString = game.cardsA.joined(separator: "-")
        let cardsA = URLQueryItem(name: "cardsA", value: cardsAString)
        let cardsBString = game.cardsB.joined(separator: "-")
        let cardsB = URLQueryItem(name: "cardsB", value: cardsBString)
        let cardsCString = game.cardsC.joined(separator: "-")
        let cardsC = URLQueryItem(name: "cardsC", value: cardsCString)
        let cardsDString = game.cardsD.joined(separator: "-")
        let cardsD = URLQueryItem(name: "cardsD", value: cardsDString)
        
        let historyString = game.history.joined(separator: "-")
        let history = URLQueryItem(name: "history", value: historyString)
        
        components.queryItems = [A, B, C, D, Dizhu, dealTypeIndex, remainCardCountIndex, winTypeIndex, deckCount, playersInGame, cardsA, cardsB, cardsC, cardsD, history]
        
        let layout = MSMessageTemplateLayout()
        layout.image = UIImage(named: "back")
        layout.caption = "到你出牌了"
        
        let message = MSMessage(session: conversation.selectedMessage?.session ?? MSSession())
        message.url = components.url!
        message.layout = layout
        
        return message
    }
}
