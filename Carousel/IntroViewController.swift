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
        //switchControl.alpha = 0
        //buttonImage.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  
        }
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        var page = Int(scrollView.contentOffset.x / 320)
        println("hello")
        //pager.currentPage = page
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


