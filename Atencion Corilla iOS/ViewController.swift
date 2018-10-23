//
//  ViewController.swift
//  Atencion Corilla iOS
//
//  Created by Maria del Carmen Ramos Alamo on 10/21/18.
//  Copyright © 2018 Maria del Carmen Ramos Alamo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    
    
    @IBOutlet weak var SignInSelector: UISegmentedControl!
    
    @IBOutlet weak var SignInLabel: UILabel!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SignInButton: UIButton!
    
    var isSignedIn:Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SignInSelectorChange(_ sender: UISegmentedControl) {
        
        // Flip the boolean
        isSignedIn = !isSignedIn
        
        // Check the bool and set thebutton and labels
        if isSignedIn{
            SignInLabel.text = "Sign In"
            SignInButton.setTitle("Sign In", for: .normal)
        }
        else{
            SignInLabel.text = "Register"
            SignInButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func SignInButtonTapped(_ sender: UIButton) {
        
        // Do some form validation on the email and password
        
        if let email = EmailTextField.text, let password = PasswordTextField.text
        {
            // Check if it's sign in or register
            if isSignedIn{
                // Sign in the user with Firebase
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    // Check that user isn't nil
                    if let u = user {
                        // User is found, go to home screen
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    }
                    else {
                        // Error: check error and show message
                    }
                }
            }
            else{
                // Register the user with Firebase
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    
                    // ...
                    // guard let user = authResult?.user else { return }
                    
                    // Check that user isn't nil
                    if let u = user {
                        // User is found, go to home screen
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    }
                    else {
                        // Error: check error and show message
                    }

                }
            }
        }
        
        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        // Dismiss the keyboard when the view is tapped on
        EmailTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    }
        
    }
    
    
}


