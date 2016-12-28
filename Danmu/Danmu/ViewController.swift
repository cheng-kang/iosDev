//
//  ViewController.swift
//  Danmu
//
//  Created by Ant on 27/12/2016.
//  Copyright © 2016 Lahk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var input: UITextField!
    
    var DM: DanmuManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DM = DanmuManager(self.view, top: 80, bottom: self.view.frame.height)
        input.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        DM!.add(DanmuModel("Test1 I Love Catherine!!!", at: 10))
        DM!.add(DanmuModel("Test2 这是一条测试噢噢噢！！！", at: 50))
        DM!.add(DanmuModel("Test3", at: 40))
        DM!.add(DanmuModel("Test4什么啊……", at: 200))
        DM!.add(DanmuModel("Test5whatwhatwaht。。", at: 75))
        DM!.add(DanmuModel("Test6 I Love Catherine!!!", at: 20))
        DM!.add(DanmuModel("Test7 这是一条测试噢噢噢！！！", at: 70))
        DM!.add(DanmuModel("Test8", at: 420))
        DM!.add(DanmuModel("Test9什么啊……", at: 120))
        DM!.add(DanmuModel("Test10whatwhatwaht。。", at: 175))
        DM!.add(DanmuModel("Test11 I Love Catherine!!!", at: 310))
        DM!.add(DanmuModel("Test12 这是一条测试噢噢噢！！！", at: 550))
        DM!.add(DanmuModel("Test13", at: 40))
        DM!.add(DanmuModel("Test14什么啊……", at: 20))
        DM!.add(DanmuModel("Test15whatwhatwaht。。", at: 15))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pauseLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }
    
    func resumeLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
    var isPause = false
    @IBAction func togglePause(sender: UIButton) {
        if isPause {
            resumeLayer(layer: self.view.layer)
        } else {
            pauseLayer(layer: self.view.layer)
        }
        
        isPause = !isPause
    }
    
    @IBAction func restartBtnClick(sender: UIButton) {
        DM!.add(DanmuModel("Test1 I Love Catherine!!!", at: 10))
        DM!.add(DanmuModel("Test2 这是一条测试噢噢噢！！！", at: 50))
        DM!.add(DanmuModel("Test3", at: 40))
        DM!.add(DanmuModel("Test4什么啊……", at: 200))
        DM!.add(DanmuModel("Test5whatwhatwaht。。", at: 75))
        DM!.add(DanmuModel("Test6 I Love Catherine!!!", at: 20))
        DM!.add(DanmuModel("Test7 这是一条测试噢噢噢！！！", at: 70))
        DM!.add(DanmuModel("Test8", at: 420))
        DM!.add(DanmuModel("Test9什么啊……", at: 120))
        DM!.add(DanmuModel("Test10whatwhatwaht。。", at: 175))
        DM!.add(DanmuModel("Test11 I Love Catherine!!!", at: 310))
        DM!.add(DanmuModel("Test12 这是一条测试噢噢噢！！！", at: 550))
        DM!.add(DanmuModel("Test13", at: 40))
        DM!.add(DanmuModel("Test14什么啊……", at: 20))
        DM!.add(DanmuModel("Test15whatwhatwaht。。", at: 15))
    }
    
    @IBAction func sendBtnClick(sender: UIButton) {
        let text = self.input.text
        if text!.characters.count > 0 {
            DM!.add(DanmuModel(text!, at: CGFloat(arc4random_uniform(500))))
        } else {
            DM!.add(DanmuModel("This is a test.", at: CGFloat(arc4random_uniform(500))))
        }
        self.input.text = ""
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
