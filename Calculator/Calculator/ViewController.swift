//
//  ViewController.swift
//  Calculator
//
//  Created by Ant on 3/10/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var btnSound: AVAudioPlayer!
    
    var result = 0
    @IBOutlet weak var resultLbl: UILabel!
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var subtract: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var equal: UIButton!
    
    var lastClick = 99
    var lastOp = 99
    var numberToCal = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zero.tag = 0
        one.tag = 1
        two.tag = 2
        three.tag = 3
        four.tag = 4
        five.tag = 5
        six.tag = 6
        seven.tag = 7
        eight.tag = 8
        nine.tag = 9
        divide.tag = 10
        multiply.tag = 11
        subtract.tag = 12
        add.tag = 13
        equal.tag = 14
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch {
            
        }
        
        reset()
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        btnSound.play()
        
        if sender.tag >= 10 && lastClick >= 10 && lastClick != 14 && lastClick != 99 {
            reset()
        }
        
        if sender.tag < 10 {
            numberToCal += "\(sender.tag)"
            updateScreen(Int(numberToCal)!)
            
        }else{
            
            if sender.tag == 14 {
                if lastClick != 14 {
                    calculate()
                    showResult()
                    lastOp = 14
                }
            }else{
                calculate()
                lastOp = sender.tag
            }
            startNewNumber()
        }
        
        lastClick = sender.tag
    }
    
    func calculate() {
        switch lastOp {
        case 10: result /= Int(numberToCal)!
            break
        case 11: result *= Int(numberToCal)!
            break
        case 12: result -= Int(numberToCal)!
            break
        case 13: result += Int(numberToCal)!
            break
        case 99: result = Int(numberToCal)!
            break
        default: break
        }
    }
    func startNewNumber() {
        numberToCal = "0"
    }
    func showResult() {
        resultLbl.text = "\(result)"
    }
    
    func updateScreen(number: Int) {
        resultLbl.text = "\(number)"
    }
    
    func reset() {
        result = 0
        
        lastClick = 99
        lastOp = 99
        numberToCal = "0"
        
        showResult()
    }

}

