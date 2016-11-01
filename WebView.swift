//
//  ViewController.swift
//  Testing
//
//  Created by Merz on 10/7/16.
//  Copyright © 2016 Merz. All rights reserved.
//

import UIKit

class WebView: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://sacs-backend-chrisblutz.c9users.io"
        let requestURL = NSURL(string:url)
        let requesting = NSURLRequest(URL: requestURL!)
        webView.loadRequest(requesting)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

