//
//  ViewController.swift
//  LabelTest
//
//  Created by Ant on 16/7/28.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var test: UITextView!
    @IBOutlet weak var tv: UITextView!
    @IBOutlet weak var tc: UITextView!
    @IBOutlet weak var lbl2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print(tv.frame.height)
        print(tv.requiredHeight())
        
        print(tv.textContainerInset)
        tv.textContainer.lineBreakMode = .ByWordWrapping
        tv.resizeToContent()
        print(lbl2.frame.height)
        print(lbl2)
        
        
        let fixedWidth = test.frame.width
        let newSize = test.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT)))
        print("newSize")
        print(newSize.height)
        
        test.frame = CGRectMake(0, 0, fixedWidth, newSize.height)
        
        
        let fixedWidth1 = tv.frame.width
        let newSize1 = tv.sizeThatFits(CGSize(width: fixedWidth1, height: CGFloat(MAXFLOAT)))
        print("newSize1")
        print(newSize1.height)
        tvheight.constant = newSize1.height
        
//        tv.frame = CGRectMake(0, 0, fixedWidth1, newSize.height+16)
    }
    
    @IBOutlet weak var tvheight: NSLayoutConstraint!
    override func viewDidLayoutSubviews() {
        tv.resizeToContent()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //        tv.frame = CGRectMake(tv.frame.origin.x, tv.frame.origin.y, tv.frame.width, tv.contentSize.height)
        lbl2.sizeToFit()
        lbl2.backgroundColor = UIColor.redColor()
        print(lbl2.frame.height)
//        tv.frame = CGRectMake(tv.frame.origin.x, tv.frame.origin.y, tv.frame.width, tv.requiredHeight())
//        tv.resizeToContent()
        print("contentsize")
        
//        print(tv.contentSize.height)
//        print(tv.requiredHeight())
        
        tc.resizeToContent()
//        requiredHeight(tv)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requiredHeight(tv: UITextView) -> CGFloat {
        let label: UILabel = UILabel(frame: CGRectMake(0,0,tv.frame.width,CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.font = tv.font
        label.text = tv.text
        
        label.alpha = 0
        self.view.addSubview(label)
        
        label.sizeToFit()
        
        print("111requiredHeight")
        print(label.frame.height)
        
        return label.frame.height
        
    }

}

extension UITextView {
    func requiredHeight() -> CGFloat {
        let label: UILabel = UILabel(frame: CGRectMake(0,0,self.frame.width - 12,CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.font = self.font
        label.text = self.text
        
        label.sizeToFit()
        
        print("requiredHeight")
        print(label.frame.height)
        
        return label.frame.height
        
    }
    
    func resizeToContent() {
        print(self.frame)
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width, requiredHeight())
        print(self.frame)
    }
}