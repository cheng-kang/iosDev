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
    
    override func viewDidAppear(_ animated: Bool) {
        let frame = CGRect(x: 0, y: 0, width: browserView.bounds.width, height: browserView.bounds.height)
        webView.frame = frame
        
        webView.load(URLRequest(url: URL(string: "https://www.youtube.com")!))
    }

    @IBAction func browseClicked(_ sender: UIButton) {
        if urlText.text != nil && urlText.text != "" {
            loadRequest(urlText.text!)
            print(urlText.text!)
        }
    }
    
    func loadRequest(_ urlStr: String) {
        webView.load(URLRequest(url: URL(string: urlStr)!))
    }
}

