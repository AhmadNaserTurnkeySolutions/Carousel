//
//  SignInViewController.swift
//  Carousel
//
//  Created by Kyle Pickering on 9/20/14.
//  Copyright (c) 2014 Kyle Pickering. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var welcomeTextImage: UIImageView!
    @IBOutlet weak var formImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInImage: UIImageView!
    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var formOriginalPosition:CGPoint
        formOriginalPosition = formImage.frame.origin
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEdit(sender: AnyObject) {
        if formImage.frame.origin == CGPoint(x: 0, y: 190) {
            animateForm("up")
        }
    }
    
    @IBAction func onPasswordEdit(sender: AnyObject) {
        if formImage.frame.origin == CGPoint(x: 0, y: 190) {
            animateForm("up")
        }
    }
    @IBAction func onViewTap(sender: AnyObject) {
        view.endEditing(true)
        if formImage.frame.origin != CGPoint(x: 0, y: 190) {
            animateForm("down")
        }
    }
    
    @IBAction func onSignInButton(sender: AnyObject) {
        var alert = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle: nil)
        if self.emailTextField.text == "" {
            UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: nil, cancelButtonTitle: "OK").show()
        } else {
            alert.show()
            delay(2, closure: { () -> () in
                alert.dismissWithClickedButtonIndex(0, animated: true)
                if self.emailTextField.text == "kyle@airbnb.com" && self.passwordTextField.text == "password" {
                    self.performSegueWithIdentifier("introSegue", sender: self)
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                } else {
                    UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: nil, cancelButtonTitle: "OK").show()
                }
            })
            
        }
    }
    
    func animateForm(direction:String) {
        var editOffset:CGFloat
        var alpha:CGFloat
        
        if direction == "up" {
            editOffset = 100
            alpha = 0
        } else {
            editOffset = -100
            alpha = 1
        }
        
        UIView.animateWithDuration(0.3, animations: {
            // move the welcomeTextImage off the screen
            self.welcomeTextImage.alpha = alpha
            self.welcomeTextImage.frame.origin.y = self.welcomeTextImage.frame.origin.y - editOffset
            
            // position the form
            self.formImage.frame.origin.y = self.formImage.frame.origin.y - editOffset
            self.emailTextField.frame.origin.y = self.emailTextField.frame.origin.y - editOffset
            self.passwordTextField.frame.origin.y = self.passwordTextField.frame.origin.y - editOffset
            
            // position the buttons
            self.signInButton.frame.origin.y = self.signInButton.frame.origin.y - editOffset
            self.signInImage.frame.origin.y = self.signInImage.frame.origin.y - editOffset
        })
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}
