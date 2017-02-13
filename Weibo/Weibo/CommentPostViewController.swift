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
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.commentFieldPos = self.commentField.frame.origin
        self.commentFieldSize = self.commentField.frame.size
        self.forwardButtonBarPos = self.forwardButtonBar.frame.origin
        self.buttonPanelPos = self.buttonPanel.frame.origin
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(CommentPostViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CommentPostViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.commentField.becomeFirstResponder()
    }
    
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.keyboardHeight == CGFloat(1) {
                self.keyboardHeight = keyboardSize.height
            }
            
            self.commentField.frame = CGRect(x: self.commentFieldPos.x, y: self.commentFieldPos.y, width: self.commentFieldSize.width, height: self.commentFieldSize.height - self.keyboardHeight)
            self.forwardButtonBar.frame = CGRect(x: 0, y: self.view.frame.height - self.keyboardHeight - self.forwardButtonBar.frame.height - self.buttonPanel.frame.height, width: self.forwardButtonBar.frame.width, height: self.forwardButtonBar.frame.height)
            self.buttonPanel.frame = CGRect(x: 0, y: self.view.frame.height - self.keyboardHeight - self.buttonPanel.frame.height, width: self.buttonPanel.frame.width, height: self.buttonPanel.frame.height)
            
        }
        
//        NSLog("%@",  NSStringFromCGRect(commentField.frame));
//        NSLog("%@",  NSStringFromCGRect(forwardButtonBar.frame));
//        NSLog("%@",  NSStringFromCGRect(buttonPanel.frame));
    }
    
    func keyboardWillHide(_ notification: Notification) {
        self.commentField.frame = CGRect(x: self.commentFieldPos.x, y: self.commentFieldPos.y, width: self.commentFieldSize.width, height: self.commentFieldSize.height)
        self.forwardButtonBar.frame = CGRect(x: 0, y: self.forwardButtonBarPos.y, width: self.forwardButtonBar.frame.width, height: self.forwardButtonBar.frame.height)
        self.buttonPanel.frame = CGRect(x: 0, y: self.buttonPanelPos.y, width: self.buttonPanel.frame.width, height: self.buttonPanel.frame.height)
        
//        NSLog("%@",  NSStringFromCGRect(commentField.frame));
//        NSLog("%@",  NSStringFromCGRect(forwardButtonBar.frame));
//        NSLog("%@",  NSStringFromCGRect(buttonPanel.frame));
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text == "")
        if textView.text == "" {
            self.sendBtn.setImage(UIImage(named: "comment_btn_not_active"), for: UIControlState())
        } else {
            self.sendBtn.setImage(UIImage(named: "comment_btn_active"), for: UIControlState())
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func swipedOnCommentField(_ sender: UISwipeGestureRecognizer) {
//        self.view.endEditing(true)
    }

}
