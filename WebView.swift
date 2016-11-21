//
//  ViewController.swift
//  Testing
//
//  Created by Merz on 10/7/16.
//  Copyright © 2016 Merz. All rights reserved.
//

import UIKit
import Foundation

class WebView: UIViewController {
    var test = 0
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var url = "https://sacs-backend-chrisblutz.c9users.io/archives/"
        // pages on 51,54,56
        url+="\(test)"
        let requestURL = NSURL(string:url)
        let requesting = NSURLRequest(URL: requestURL!)
        webView.loadRequest(requesting)
        print(test)
        let notification = UILocalNotification()
        notification.alertBody = "test" // text that will be displayed in the notification
        notification.alertAction = "open"
        notification.fireDate = NSDate(timeIntervalSinceReferenceDate: 5) // todo item due date (when notification will be fired) notification.soundName = UILocalNotificationDefaultSoundName // play default sound
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}