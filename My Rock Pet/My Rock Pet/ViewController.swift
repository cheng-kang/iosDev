//
//  ViewController.swift
//  My Rock Pet
//
//  Created by Ant on 3/11/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var heartImg: DraggableImage!
    @IBOutlet weak var foodImg: DraggableImage!
    @IBOutlet weak var skull1Img: UIImageView!
    @IBOutlet weak var skull2Img: UIImageView!
    @IBOutlet weak var skull3Img: UIImageView!
    @IBOutlet weak var rockPetImg: Pet!
    @IBOutlet weak var timeLbl: UILabel!
    
    var bgMusic: AVAudioPlayer!
    var deathAudio: AVAudioPlayer!
    var heartAudio: AVAudioPlayer!
    var skullAudio: AVAudioPlayer!
    var biteAudio: AVAudioPlayer!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    
    let DAMAGE_MAX = 3
    
    var damage = 0
    var timer: Timer!
    var timerForTimeLbl: Timer!
    var petHappy = false
    var currentItem: UInt32 = 0
    var currentTimeLbl = "3"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //init audios
        do {
            try bgMusic = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "cave-music", ofType: "mp3")!))
            try deathAudio = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "death", ofType: "wav")!))
            try heartAudio = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "heart", ofType: "wav")!))
            try skullAudio = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "skull", ofType: "wav")!))
            try biteAudio = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "bite", ofType: "wav")!))
            
            bgMusic.prepareToPlay()
            deathAudio.prepareToPlay()
            heartAudio.prepareToPlay()
            skullAudio.prepareToPlay()
            biteAudio.prepareToPlay()
            
            bgMusic.play()
        } catch {
            print(error)
        }
        
        //init game status
        skull1Img.alpha = DIM_ALPHA
        skull2Img.alpha = DIM_ALPHA
        skull3Img.alpha = DIM_ALPHA
        
        setCurrentInteraction()
        
        heartImg.dropTarget = rockPetImg
        foodImg.dropTarget = rockPetImg
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.interactWithPet), name: NSNotification.Name(rawValue: "draggedOnTarget"), object: nil)
        //startgame
        startGame()
    }
    
    func startGame() {
        startTimer()
        
    }
    
    func interactWithPet() {
        petHappy = true
        
        if currentItem == 0 {
            biteAudio.play()
        }else{
            if damage > 0 {
                damage -= 1
                updateDamagePanel()
            }
            heartAudio.play()
        }
    }
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
//        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "updateGameState", userInfo: nil, repeats: true)
        timerForTimeLbl = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateGameState), userInfo: nil, repeats: true)
    }
    
    func updateTimeLbl() {
        if currentTimeLbl == "1" {
            currentTimeLbl = "3"
        }else{
            currentTimeLbl = "\(Int(currentTimeLbl)!-1)"
        }
        
        timeLbl.text = currentTimeLbl
        
    }
    
    func updateGameState() {
        updateTimeLbl()
        
        if currentTimeLbl == "3" {
            if !petHappy {
                damage += 1
                skullAudio.play()
            }
            
            updateDamagePanel()
            
            if damage != DAMAGE_MAX {
                setCurrentInteraction()
                petHappy = false
            }
        }
    }
    
    func updateDamagePanel() {
        switch damage {
        case 0: skull1Img.alpha = DIM_ALPHA
        skull1Img.alpha = DIM_ALPHA
            break
        case 1: skull1Img.alpha = OPAQUE
        skull2Img.alpha = DIM_ALPHA
            break
        case 2: skull2Img.alpha = OPAQUE
        skull3Img.alpha = DIM_ALPHA
            break
        case 3: skull3Img.alpha = OPAQUE
            gameOver()
            break
        default: break
        }
    }
    
    func setCurrentInteraction() {
        
        let rand = arc4random_uniform(2)
        
        switch rand {
        case 0: foodImg.isUserInteractionEnabled = true
        foodImg.alpha = OPAQUE
        heartImg.isUserInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
            break
        case 1: heartImg.isUserInteractionEnabled = true
        heartImg.alpha = OPAQUE
        foodImg.isUserInteractionEnabled = false
        foodImg.alpha = DIM_ALPHA
            break
        default: break
        }
        
        currentItem = rand
    }
    
    func gameOver() {
        if timer != nil {
            timer.invalidate()
        }
        foodImg.isUserInteractionEnabled = false
        foodImg.alpha = DIM_ALPHA
        heartImg.isUserInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        rockPetImg.playDeadAnimation()
        deathAudio.play()
    }
    
    
}

