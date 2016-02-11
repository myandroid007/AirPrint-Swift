//
//  ViewController.swift
//  PrintTut
//
//  Created by Jacob Voyles on 2/10/16.
//  Copyright © 2016 CuriousApps Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.loadHTMLString("<html><body>Hello World! First time printing </body></html>", baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Print(sender: AnyObject) {
        
        var pInfo : UIPrintInfo = UIPrintInfo.printInfo()
        pInfo.outputType = UIPrintInfoOutputType.General
        pInfo.jobName = (webView.request?.URL?.absoluteString)!
        pInfo.orientation = UIPrintInfoOrientation.Portrait
        
        var printController = UIPrintInteractionController.sharedPrintController()
        
        printController.printInfo = pInfo
        printController.showsPageRange = true
        printController.printFormatter = webView.viewPrintFormatter()
        
        printController.presentAnimated(true, completionHandler: nil)
    }

}

