//
//  SignUpViewController.swift
//  Sign In Test
//
//  Created by Gian Guerra on 3/30/20.
//  Copyright © 2020 Gian Guerra. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        setupElements()
    }
    func setupElements() {
        
        //Hide error label
        errorLabel.alpha = 0
        
        //Style elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    //checks field
    func validateFields()-> String? {
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        //check fields are filled in
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password isnt secure
            return "Please make sure your password is set to at east 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    @IBAction func signUpTapped() {
        
        //validate fields
        let error = validateFields()
        
        if error  != nil {
            //something wrong with field
            showError(message: error!)
        }
        else{
            //create user
            Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>) { (result, err) in
                //check for errors
                if err != nil {
                    //there was an error creating user
                    self.showError(message: "Error creating user")
                }
                else {
                    //user created successfully
                }
            
            }
            //transition to home screen
        }
        
    }
    
    func showError(message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}
