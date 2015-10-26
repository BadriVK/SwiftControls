//
//  WebViewController.swift
//  SwiftDemo
//
//  Created by Arpit Vishwakarma on 03/09/15.
//  Copyright (c) 2015 Arpit. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, MBProgressHUDDelegate {
    
    var HUD: MBProgressHUD?
    let reachability = AVReachability.reachabilityForInternetConnection()

   @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.

        
        if reachability?.isReachable() == true {
            HUD = MBProgressHUD(view: self.navigationController!.view)
            self.navigationController!.view.addSubview(HUD!)
            HUD!.dimBackground = true
            
            // Regiser for HUD callbacks so we can remove it from the window at the right time
            HUD!.delegate = self;
            //HUD!.showWhileExecuting("myTask", onTarget: self, withObject: nil, animated: true)
            HUD?.show(true)
            
            let url = NSURL(string: "http://www.apple.com")
            let urlRequest = NSURLRequest(URL: url!)
            webView.loadRequest(urlRequest)
            
        } else {
            let alertView = UIAlertController(title: "Message!", message: "No network.", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidFinishLoad(webView: UIWebView){
        HUD?.hide(true)
    }

}
