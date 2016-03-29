//
//  CommentPostViewController.swift
//  Weibo
//
//  Created by Ant on 3/24/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class CommentPostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var commentField: UITextView!
    @IBOutlet weak var forwardButtonBar: UIView!
    @IBOutlet weak var buttonPanel: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    
    var keyboardHeight = CGFloat(1)
    var flag = false
    
    var commentFieldPos: CGPoint!
    var commentFieldSize: CGSize!
    var forwardButtonBarPos: CGPoint!
    var buttonPanelPos: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentField.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.commentFieldPos = self.commentField.frame.origin
        self.commentFieldSize = self.commentField.frame.size
        self.forwardButtonBarPos = self.forwardButtonBar.frame.origin
        self.buttonPanelPos = self.buttonPanel.frame.origin
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        
        self.commentField.becomeFirstResponder()
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() {
            
            if self.keyboardHeight == CGFloat(1) {
                self.keyboardHeight = keyboardSize.height
            }
            
            self.commentField.frame = CGRectMake(self.commentFieldPos.x, self.commentFieldPos.y, self.commentFieldSize.width, self.commentFieldSize.height - self.keyboardHeight)
            self.forwardButtonBar.frame = CGRectMake(0, self.view.frame.height - self.keyboardHeight - self.forwardButtonBar.frame.height - self.buttonPanel.frame.height, self.forwardButtonBar.frame.width, self.forwardButtonBar.frame.height)
            self.buttonPanel.frame = CGRectMake(0, self.view.frame.height - self.keyboardHeight - self.buttonPanel.frame.height, self.buttonPanel.frame.width, self.buttonPanel.frame.height)
            
        }
        
//        NSLog("%@",  NSStringFromCGRect(commentField.frame));
//        NSLog("%@",  NSStringFromCGRect(forwardButtonBar.frame));
//        NSLog("%@",  NSStringFromCGRect(buttonPanel.frame));
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.commentField.frame = CGRectMake(self.commentFieldPos.x, self.commentFieldPos.y, self.commentFieldSize.width, self.commentFieldSize.height)
        self.forwardButtonBar.frame = CGRectMake(0, self.forwardButtonBarPos.y, self.forwardButtonBar.frame.width, self.forwardButtonBar.frame.height)
        self.buttonPanel.frame = CGRectMake(0, self.buttonPanelPos.y, self.buttonPanel.frame.width, self.buttonPanel.frame.height)
        
//        NSLog("%@",  NSStringFromCGRect(commentField.frame));
//        NSLog("%@",  NSStringFromCGRect(forwardButtonBar.frame));
//        NSLog("%@",  NSStringFromCGRect(buttonPanel.frame));
    }
    
    func textViewDidChange(textView: UITextView) {
        print(textView.text == "")
        if textView.text == "" {
            self.sendBtn.setImage(UIImage(named: "comment_btn_not_active"), forState: .Normal)
        } else {
            self.sendBtn.setImage(UIImage(named: "comment_btn_active"), forState: .Normal)
        }
    }
    
    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func swipedOnCommentField(sender: UISwipeGestureRecognizer) {
//        self.view.endEditing(true)
    }

}
