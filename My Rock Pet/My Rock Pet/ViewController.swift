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
    var timer: NSTimer!
    var timerForTimeLbl: NSTimer!
    var petHappy = false
    var currentItem: UInt32 = 0
    var currentTimeLbl = "3"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //init audios
        do {
            try bgMusic = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            try deathAudio = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            try heartAudio = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            try skullAudio = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            try biteAudio = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            
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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "interactWithPet", name: "draggedOnTarget", object: nil)
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
                damage--
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
        timerForTimeLbl = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateGameState", userInfo: nil, repeats: true)
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
                damage++
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
        case 0: foodImg.userInteractionEnabled = true
        foodImg.alpha = OPAQUE
        heartImg.userInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
            break
        case 1: heartImg.userInteractionEnabled = true
        heartImg.alpha = OPAQUE
        foodImg.userInteractionEnabled = false
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
        foodImg.userInteractionEnabled = false
        foodImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        rockPetImg.playDeadAnimation()
        deathAudio.play()
    }
    
    
}

