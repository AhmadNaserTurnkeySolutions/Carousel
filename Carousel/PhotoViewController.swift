//
//  PhotoViewController.swift
//  Carousel
//
//  Created by Kyle Pickering on 9/21/14.
//  Copyright (c) 2014 Kyle Pickering. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if !defaults.boolForKey("hasViewedPhoto") {
             defaults.setBool(true, forKey: "hasViewedPhoto")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
