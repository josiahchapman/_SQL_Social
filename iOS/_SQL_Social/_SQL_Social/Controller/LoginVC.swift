//
//  LoginVC.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 4/9/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        
        loginButton.layer.cornerRadius = 23
        registerButton.layer.cornerRadius = 23
        
        emailField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
        passwordField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        var isEmailValid = true
        var isPasswordValid = true
        
        if (emailField.text == "" || emailField.text == nil) || RegistrationInfoService.instance.isEmailValid(email: emailField.text) {
            isEmailValid = false
            emailField.attributedPlaceholder = NSAttributedString(string: "* Enter your account email", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8284956813, green: 0, blue: 0, alpha: 1)])
        }
        
        if passwordField.text == "" ||  passwordField.text == nil {
            isPasswordValid = false
            passwordField.attributedPlaceholder = NSAttributedString(string: "* Enter your account password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8284956813, green: 0, blue: 0, alpha: 1)])
        }
        
        if isEmailValid, isPasswordValid {
            // login
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let tabBar = storyboard.instantiateViewController(withIdentifier: "tabBar")
//            self.present(tabBar, animated: true, completion: nil)
            
            let tabBar = (storyboard.instantiateViewController(withIdentifier: "tabBar") as? UITabBarController)
            self.present(tabBar!, animated: true, completion: nil)
            
        }
    }
}
