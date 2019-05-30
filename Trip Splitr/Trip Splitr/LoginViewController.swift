//
//  LoginViewController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginTypeSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var signInButton: UIButton!

    // The "mailbox" to pass the APIController from the login VC to here.
    //var apiController: APIController?
    var signInType: SignInType = .signUp

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    private func updateViews() {
        view.backgroundColor = AppearanceHelper.lightBlue
        usernameTextField.backgroundColor = AppearanceHelper.lightGray
        passwordTextField.backgroundColor = AppearanceHelper.lightGray
        loginTypeSegmentedControl.tintColor = AppearanceHelper.darkBlue
        signInButton.tintColor = .white
        loginTypeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        loginTypeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }
    
    @IBAction func signInTypeChanged(_ sender: Any) {
        if loginTypeSegmentedControl.selectedSegmentIndex == 0 {
            signInType = .signUp
            signInButton.setTitle("Sign Up", for: .normal)
            nameTextField.isHidden = false
            emailTextField.isHidden = false
        } else {
            signInType = .logIn
            signInButton.setTitle("Log In", for: .normal)
            nameTextField.isHidden = true
            emailTextField.isHidden = true
        }
    }

    @IBAction func authenticate(_ sender: Any) {

        guard let username = usernameTextField.text,
            let password = passwordTextField.text,
            let name = nameTextField.text,
            let email = emailTextField.text else { return }

        switch signInType {

        case .signUp:
            print("signUp")

            apiController?.register(with: name, username: username, password: password, email: email, completion: { (error) in
                if let error = error {
                    NSLog("Error signing up: \(error)")
                } else {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Sign Up Successful", message: "Now please log in.", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true, completion: {
                            
                        })
                    }
                }
            })


        case .logIn:
            print("Login")

            apiController?.logIn(with: username, password: password, completion: { (error) in
                if let error = error {
                    NSLog("Error loggin in: \(error)")
                } else {
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            })

        }
    }


    var apiController: APIController?

    enum SignInType {
        case signUp
        case logIn
    }
    
    
    
 
    
    
    
}
