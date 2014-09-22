//
//  FeedViewController.swift
//  Carousel
//
//  Created by Kyle Pickering on 9/20/14.
//  Copyright (c) 2014 Kyle Pickering. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var singleImage: UIButton!
    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var dismissLearnMoreButton: UIButton!
    
    var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = feedImage.frame.size
        scrollView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 36, right: 0)
        scrollView.contentOffset.y = -44

        if !defaults.boolForKey("hasSharedPhoto") {
            defaults.setBool(false, forKey: "hasSharedPhoto")
            defaults.setBool(false, forKey: "hasUsedTimeWheel")
            defaults.setBool(false, forKey: "hasViewedPhoto")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onDismissButton(sender: AnyObject) {
        dismissBanner()
    }
    
    func dismissBanner() {
        UIView.animateWithDuration(0.3, animations: {
            self.learnMoreButton.alpha = 0
            self.learnMoreButton.frame.origin.y = 10
            
            self.dismissLearnMoreButton.alpha = 0
            self.dismissLearnMoreButton.frame.origin.y = 10
            
            self.scrollView.contentInset.top = 0
        })
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
