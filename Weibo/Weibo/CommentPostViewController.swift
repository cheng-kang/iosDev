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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            flag = true
            print("aaa")
            print(keyboardSize.height)
            self.keyboardHeight = keyboardSize.height
            print("bbb")
            print(self.keyboardHeight)
            self.commentField.frame = CGRectMake(self.commentField.frame.origin.x, self.commentField.frame.origin.y, self.commentField.frame.width, self.commentField.frame.height - self.keyboardHeight)
            self.forwardButtonBar.frame.origin.y -= self.keyboardHeight
            self.buttonPanel.frame.origin.y -= self.keyboardHeight
            
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            print("ccc")
            print(keyboardSize.height)
            print("ddd")
            print(self.keyboardHeight)
            if flag {
                self.commentField.frame = CGRectMake(self.commentField.frame.origin.x, self.commentField.frame.origin.y, self.commentField.frame.width, self.commentField.frame.height + self.keyboardHeight)
                self.forwardButtonBar.frame.origin.y += self.keyboardHeight
                self.buttonPanel.frame.origin.y += self.keyboardHeight
            }
        }
    }
    
    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
