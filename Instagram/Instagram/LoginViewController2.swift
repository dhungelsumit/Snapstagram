//
//  LoginViewController.swift
//  Instagram
//
//  Created by Sumit Dhungel on 3/10/17.
//  Copyright © 2017 Sumit Dhungel. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!){
            user, error in
            if user != nil{
                print("User logined")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                let alertController = UIAlertController(title: "ERROR", message: "INVALID VALUES", preferredStyle: .alert)
                
                
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                
                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            }
        }    }

    @IBAction func onSignUp(_ sender: Any) {
        
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground {
            (succeeded: Bool, error:Error?) -> Void in
            if succeeded {
                print("Created a user")
                let alertController = UIAlertController(title: "Hello", message: "Welcome to Instagram", preferredStyle: .alert)
                
                
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                    
                }
                alertController.addAction(cancelAction)
                
                
                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("Error is : ",error?.localizedDescription)
            }
        }    }    /*
        
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    }
