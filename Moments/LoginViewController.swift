//
//  LoginViewController.swift
//  Moments
//
//  Created by Varun Goel on 3/9/16.
//  Copyright © 2016 Varun Goel. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {
    
    
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    //to sign in, do this
    @IBAction func onSignIn(sender: AnyObject) {
        let username = userNameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsernameInBackground(username, password: password) { (user: PFUser?, error: NSError?) -> Void in
            if let error = error {
                print("User login failed.")
                print(error.localizedDescription)
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    
    //to sign up, do this
    @IBAction func onSignUp(sender: AnyObject) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = userNameField.text
       // newUser.email = emailLabel.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if let error = error {
                if error.code == 202{
                    
                }
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                // display view controller that needs to shown after successful login
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
