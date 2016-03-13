//
//  ViewController.swift
//  A Simple Web Browser
//
//  Created by Ant on 3/13/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var urlText: UITextField!
    @IBOutlet weak var browserView: UIView!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        browserView.addSubview(webView)
    }
    
    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, browserView.bounds.width, browserView.bounds.height)
        webView.frame = frame
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.youtube.com")!))
    }

    @IBAction func browseClicked(sender: UIButton) {
        if urlText.text != nil && urlText.text != "" {
            loadRequest(urlText.text!)
            print(urlText.text!)
        }
    }
    
    func loadRequest(urlStr: String) {
        webView.loadRequest(NSURLRequest(URL: NSURL(string: urlStr)!))
    }
}

