//
//  GettingStartedViewController.swift
//  Carousel
//
//  Created by Kyle Pickering on 9/21/14.
//  Copyright (c) 2014 Kyle Pickering. All rights reserved.
//

import UIKit

class GettingStartedViewController: UIViewController {

    @IBOutlet weak var viewPhotoCheckmark: UIButton!
    @IBOutlet weak var timeWheelCheckmark: UIButton!
    @IBOutlet weak var shareCheckmark: UIButton!
    
    var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        shareCheckmark.selected = defaults.boolForKey("hasSharedPhoto")
        timeWheelCheckmark.selected = defaults.boolForKey("hasUsedTimeWheel")
        viewPhotoCheckmark.selected = defaults.boolForKey("hasViewedPhoto")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCloseButton(sender: AnyObject) {
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
