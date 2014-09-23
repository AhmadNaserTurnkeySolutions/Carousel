//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by Kyle Pickering on 9/21/14.
//  Copyright (c) 2014 Kyle Pickering. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var createTextImage: UIImageView!
    @IBOutlet weak var createFormImage: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var termsTextImage: UIImageView!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = scrollView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func onEditFirstNameTextField(sender: AnyObject) {
        animateForm("up")
    }
    
    @IBAction func onEditLastNameTextField(sender: AnyObject) {
        animateForm("up")
    }
    
    @IBAction func onEditEmailTextField(sender: AnyObject) {
        animateForm("up")
    }
    
    @IBAction func onEditPasswordTextField(sender: AnyObject) {
        animateForm("furtherUp")
    }
    
    @IBAction func onTermsButton(sender: AnyObject) {
        if createFormImage.frame.origin != CGPoint(x: 0, y: 190) {
            animateForm("down")
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        if createFormImage.frame.origin != CGPoint(x: 0, y: 190) {
            animateForm("down")
        }
    }
    
    @IBAction func onCheckboxButton(sender: AnyObject) {
        if !checkboxButton.selected {
            checkboxButton.selected = true
        } else {
            checkboxButton.selected = false
        }
    }

    func animateForm(direction:String) {
        var editOffset:CGFloat
        
        switch direction {
            case "up":
                UIView.animateWithDuration(0.3, animations: {
                    self.scrollView.contentInset.top = -100
                    self.scrollView.contentInset.bottom = 160
                    self.createTextImage.alpha = 0
                    self.scrollView.contentOffset.y = 100
                })
            case "furtherUp":
                UIView.animateWithDuration(0.3, animations: {
                    self.scrollView.contentInset.top = -100
                    self.scrollView.contentInset.bottom = 160
                    self.scrollView.contentOffset.y = 160
                    self.createTextImage.alpha = 0
                })
            default:
                UIView.animateWithDuration(0.3, animations: {
                    self.scrollView.contentInset.top = 0
                    self.scrollView.contentInset.bottom = 0
                    self.createTextImage.alpha = 1
                })
        }
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
