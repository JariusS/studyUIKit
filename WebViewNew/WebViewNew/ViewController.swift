//
//  ViewController.swift
//  WebViewNew
//
//  Created by Ярослав  on 02.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backOutlet: UIBarButtonItem!
    @IBOutlet weak var goForwardOutlet: UIBarButtonItem!
    @IBOutlet weak var refreshOutlet: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myUrl = URL(string: "https://www.google.com") {
            let result = URLRequest(url: myUrl)
            webView.load(result)
            
            webView.uiDelegate = self
        }
        
        
        //MARK: - Method
    }
    @IBAction func goBackItem(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            backOutlet.isEnabled = true
            webView.goBack()
        } else {
            backOutlet.isEnabled = false
        }
    }
    @IBAction func goForwardItem(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            goForwardOutlet.isEnabled = true
            webView.goForward()
        } else {
            goForwardOutlet.isEnabled = false
        }
    }
    @IBAction func refreshItem(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
  
    

}


