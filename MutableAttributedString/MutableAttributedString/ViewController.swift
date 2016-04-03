//
//  ViewController.swift
//  MutableAttributedString
//
//  Created by Ant on 4/2/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    var post = [
        "username" : "chengkang",
        "content" : "Very quietly @I take my #leave\nAs quietly as I came here;\nQuietly I wave good-bye\nTo the rosy clouds in the western sky.\nThe golden willows by the riverside\nAre young brides in the setting sun;\nTheir reflections on the shimmering waves\nAlways linger in the depth of my heart.\nThe floating heart growing the sludge\nSways leisurely under the water;\nIn the gentle waves of Cambridge\nI would be a water plant!\nThat pool under the shade of elm trees\nHolds not water but the rainbow from the sky;\nShattered to pieces among the duck weeds\nIs the sediment of a rainbow-like dream?\nTo seek a dream?\n"
    ]
//    "Very quietly @I take my #leave\nAs quietly as I came here;\nQuietly I wave good-bye\nTo the rosy clouds in the western sky.\nThe golden willows by the riverside\nAre young brides in the setting sun;\nTheir reflections on the shimmering waves\nAlways linger in the depth of my heart.\nThe floating heart growing the sludge\nSways leisurely under the water;\nIn the gentle waves of Cambridge\nI would be a water plant!\nThat pool under the shade of elm trees\nHolds not water but the rainbow from the sky;\nShattered to pieces among the duck weeds\nIs the sediment of a rainbow-like dream?\nTo seek a dream?\nJust to pole a boat upstream\nTo where the green grass is more verdant\nOr to have the boat fully loaded with starlight\nAnd sing aloud in the splendor of starlight.\nBut I can’t sing aloud\nQuietness is my farewell music;\nEven summer insects heap silence for me\nSilent is Cambridge tonight!\nVery quietly I left\nAs quietly as I came here;\nGently I flick my sleeves\nNot even a wisp of cloud will I bring away\n"
    
    var mutableString: NSMutableAttributedString = NSMutableAttributedString(string:"")
    
    var startLoationOfParagraphs: [Int] = []
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        self.mutableString = NSMutableAttributedString(string: post["username"]!+post["content"]!)
        
//        mutableString.addAttributes(
//            [
//                NSLinkAttributeName: NSURL(string: "user://"+post["username"]!)!,
//                NSFontAttributeName: UIFont(name: "Didot", size: 30.0)!,
//                NSForegroundColorAttributeName: UIColor.redColor()
//            ],
//            range: NSRange(location: 0, length: post["username"]!.characters.count)
//        )
//        mutableString.setAttributes(
//            [
//                NSLinkAttributeName: NSURL(string: "user://"+post["username"]!)!,
//                NSFontAttributeName: UIFont(name: "Didot", size: 30.0)!,
//            ],
//            range: NSRange(location: 0, length: post["username"]!.characters.count)
//        )
        
        mutableString.addAttribute(NSFontAttributeName, value: UIFont(name: "Times New Roman", size: 20.0)!, range: NSRange(location: post["username"]!.characters.count, length: post["content"]!.characters.count))
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.paragraphSpacing = 10.0
        mutableString.addAttribute(NSParagraphStyleAttributeName, value: paraStyle, range: NSRange(location: 0, length: mutableString.length))
        
        
        
        textView.attributedText = mutableString
        
        textView.linkTextAttributes = [
            NSForegroundColorAttributeName: UIColor.redColor()
        ]
        resetP()
    }
    
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        print(URL.absoluteString)
        return false
    }
    
    func textViewDidChange(textView: UITextView) {
        print(textView.selectedRange.toRange())
        resetP()
    }
    
    func resetP() {
        
        let paragraphs = textView.text.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        
        self.startLoationOfParagraphs = []
        
        let COUNT = paragraphs.count
        
        for var i = 0; i < COUNT; i++ {
            let location = i == 0 ? paragraphs[0].characters.count : i == COUNT-1 ? self.startLoationOfParagraphs[i-1] + 1 : paragraphs[i].characters.count + self.startLoationOfParagraphs[i-1] + 1
            self.startLoationOfParagraphs.append(location)
        }
    }
    
    func getRange() -> NSRange {
        let cursorPos = textView.selectedRange.toRange()?.startIndex
        var startPos = 0
        var length = 0
        
        for var i = 0; i < self.startLoationOfParagraphs.count; i++ {
            if cursorPos <= self.startLoationOfParagraphs[i] {
                startPos = i == 0 ? 0 : self.startLoationOfParagraphs[i-1]
                length = i == 0 ? self.startLoationOfParagraphs[0] : self.startLoationOfParagraphs[i] - startLoationOfParagraphs[i-1]
                
                break
            }
        }
        
        print(cursorPos)
        print(startLoationOfParagraphs)
        print(startPos)
        print(length)
        
        return NSRange(location: startPos, length: length)
        
    }
    
    @IBAction func boldParagraph(sender: UIButton) {
        let cursorPos = textView.selectedRange.toRange()?.startIndex
        
        self.mutableString.addAttribute(NSFontAttributeName, value: UIFont(name: "TimesNewRomanPS-BoldMT", size: 20.0)!, range: getRange())
        
        self.textView.attributedText = self.mutableString
        
        self.textView.selectedRange = NSMakeRange(cursorPos!, 0)
        
        resetP()
    }
    
    @IBAction func italicParagraph(sender: UIButton) {
        let cursorPos = textView.selectedRange.toRange()?.startIndex
        
        self.mutableString.addAttribute(NSFontAttributeName, value: UIFont(name: "TimesNewRomanPS-ItalicMT", size: 20.0)!, range: getRange())
        
        self.textView.attributedText = self.mutableString
        
        self.textView.selectedRange = NSMakeRange(cursorPos!, 0)
        
        resetP()
    }
    


}

