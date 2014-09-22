//
//  IntroViewController.swift
//  Carousel
//
//  Created by Kyle Pickering on 9/20/14.
//  Copyright (c) 2014 Kyle Pickering. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var buttonImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSizeMake(1280, 568)
        scrollView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        var page = Int(scrollView.contentOffset.x / 320)
        pager.currentPage = page
        
        if page > 2 {
            pager.alpha = 0
            UIView.animateWithDuration(0.3, animations: {
                self.buttonImage.alpha = 1
                self.switchControl.alpha = 1
                
            })
        } else {
            pager.alpha = 1
            switchControl.alpha = 0
            buttonImage.alpha = 0
        }
    }
}