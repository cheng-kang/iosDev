//
//  CommentPostViewController.swift
//  Weibo
//
//  Created by Ant on 3/24/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class CommentPostViewController: UIViewController {

    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var forwardButtonBar: UIView!
    @IBOutlet weak var buttonPanel: UIView!
    
    var keyboardHeight = CGFloat(1)
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        commentField.becomeFirstResponder()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            print("aaa")
            print(keyboardSize.height)
            self.keyboardHeight = keyboardSize.height
            print("bbb")
            
            
            self.commentField.frame.size.height -= self.keyboardHeight
            
            
        }
        
        NSLog("%@",  NSStringFromCGRect(commentField.frame));
        NSLog("%@",  NSStringFromCGRect(forwardButtonBar.frame));
        NSLog("%@",  NSStringFromCGRect(buttonPanel.frame));
    }
    
    func keyboardWillHide(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                print("ccc")
                print(keyboardSize.height)
                print("ddd")
                print(self.keyboardHeight)
                
                
                self.commentField.frame.size.height += self.keyboardHeight == 1.0 ? 0 : self.keyboardHeight
            }
        
        NSLog("%@",  NSStringFromCGRect(commentField.frame));
        NSLog("%@",  NSStringFromCGRect(forwardButtonBar.frame));
        NSLog("%@",  NSStringFromCGRect(buttonPanel.frame));
    }
    
    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
