//
//  LoginViewController.swift
//  Carousel
//
//  Created by Blake Hudelson on 2/11/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInNavBar: UIImageView!
    
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -5
        
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        loginScrollView.delegate = self
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        signInNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        signInNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.signInNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.signInNavBar.alpha = 1
        }
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        activityIndicator.startAnimating()
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty{
            
            let alertController  = UIAlertController(title: "Email Required", message: "Please try again.", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true){
            }
            self.activityIndicator.stopAnimating()
        }else if emailField.text == "em" && passwordField.text == "pw"{
            delay(2, closure: { () -> () in
                self.activityIndicator.stopAnimating()
                self.performSegueWithIdentifier("firstSegue", sender: nil)
                
            })
        }else{
            delay(2, closure: { () -> () in
                self.activityIndicator.stopAnimating()
                let failController  = UIAlertController(title: "Incorrect Email and Password", message: "Please try again.", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                }
                failController.addAction(cancelAction)
                self.presentViewController(failController, animated: true){
                }
                
                
            })
            
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    func loginScrollViewDidScroll(scrollView: UIScrollView) {
        if loginScrollView.contentOffset.y <= 50 {
            // Hide the keyboard
            view.endEditing(true)
        }
        // This method is called as the user scrolls
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
