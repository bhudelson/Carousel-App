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
    @IBOutlet weak var signinButton: UIButton!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    var fieldInitialY: CGFloat!
    var fieldOffset: CGFloat!
    
    @IBAction func signinButton(sender: AnyObject) {
        if emailField.text == "email" && passwordField.text == "password" {
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.activityIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.signinButton.selected = false
                // perform the Segue to the next screen.
                self.performSegueWithIdentifier("signinSegue", sender: nil)
            })
        } else {
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.activityIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.signinButton.selected = false
                // Create and Show UIAlertController...see guide, Using UIAlertController
            })
        }
       
    
    }
    func keyboardWillShow(notification: NSNotification!) {
       
        fieldParentView.frame.origin.y = fieldInitialY + fieldOffset
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 50 {
            // Hide the keyboard
            view.endEditing(true)
        }
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
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
        
        fieldInitialY = fieldParentView.frame.origin.y
        fieldOffset = -125
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -215
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = fieldInitialY
    }

        // Do any additional setup after loading the view.

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
    
    
    // create a cancel action
    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
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
