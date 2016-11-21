//
//  ViewController.swift
//  Testing
//
//  Created by Merz on 10/7/16.
//  Copyright © 2016 Merz. All rights reserved.
//

import UIKit


class SplashViewController: UIViewController {
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        print("test1")
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        // Get the Document directory path
        let documentDirectorPath:String = paths[0]
        // Create a new path for the new images folder
        let imagesDirectoryPath = documentDirectorPath.stringByAppendingString("/SplashScreen")
        var objcBool:ObjCBool = true
        let isExist = NSFileManager.defaultManager().fileExistsAtPath(imagesDirectoryPath, isDirectory: &objcBool)
        // If the folder with the given path doesn't exist already, create it
        if isExist == false{
            do{
                try NSFileManager.defaultManager().createDirectoryAtPath(imagesDirectoryPath, withIntermediateDirectories: true, attributes: nil)
            }catch{
                print("this folder already exists - or something went wrong")
            }
        }
        super.viewDidLoad()
        
        addBackgroundImage()
        //addLogo()
        
        // Show the home screen after a bit. Calls the show() function.
        //self.show()
        NSTimer.scheduledTimerWithTimeInterval(
            2.5, target: self, selector: #selector(SplashViewController.show), userInfo: nil, repeats: false
        )
        print("test")
    }
    
    /*
     * Gets rid of the status bar
     *
     override func prefersStatusBarHidden(); -&gt; Bool {
     return true
     }*/
    
    /*
     * Shows the app's main home screen.
     * Gets called by the timer in viewDidLoad()
     */
    func show() {
        self.performSegueWithIdentifier("showApp", sender: self)
    }
    
    /*
     * Adds background image to the splash screen
     */
    func addBackgroundImage() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        var bg = UIImage()
        let url = NSURL(string: "http://pngimagesfree.com/NATURE/Grass/grass_png_paradise.png")
        //http://pngimagesfree.com/NATURE/Grass/grass_png_paradise.png
        //http://pngimg.com/upload/small/Acorn_PNG744.png
        //http://pngimg.com/upload/grass_PNG10863.png
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        // Get the Document directory path
        let documentDirectorPath:String = paths[0]
        // Set the path for the images
        let localImagesDirectoryPath = documentDirectorPath.stringByAppendingString("/SplashScreen/grass.png")
        if NSData(contentsOfURL: url!) != nil{ //note that this only ensures there is a file, it doesn't validate the pictureness of it
            let data = NSData(contentsOfURL: url!)
            //if UIImage(data: data!) != nil{ //may be needed, if there is a risk of non-picture files at link. No file at link is safe and fails the NSData if
            bg = UIImage(data: data!)!
            //} else{
                        
            NSFileManager.defaultManager().createFileAtPath(localImagesDirectoryPath, contents: data, attributes: nil)
        } else{
            print("failed to contact website")
            bg = UIImage(contentsOfFile: localImagesDirectoryPath)!
        }
        //print(localImagesDirectoryPath)
        let bgView = UIImageView(image: bg)
        
        bgView.frame = CGRectMake(0, 0, screenSize.width, screenSize.height)
        self.view.addSubview(bgView)
    }
    
    /*
     * Adds logo to splash screen
     */
    func addLogo() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let url = NSURL(fileURLWithPath: "http://www.sacs.k12.in.us//cms/lib07/IN01907860/Centricity/Domain/4/jg.jpg")//can't take jpgs?
        let data = NSData(contentsOfURL: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        let logo = UIImage(data: data!)
        
        //let logo     = UIImage(named: "homesteadhigh.png")
        let logoView = UIImageView(image: logo)
        
        let w = logo?.size.width
        let h = logo?.size.height
        
        logoView.frame = CGRectMake( (screenSize.width/2) - (w!/2), 5, w!, h! )
        self.view.addSubview(logoView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}





