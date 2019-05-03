//
//  CompleteRegisterVC.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 4/9/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class CompleteRegisterVC: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        
        signUpButton.layer.cornerRadius = 23
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
        confirmPasswordField.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        // check if valid password
        if (passwordField.text ==  nil || passwordField.text == "") || (confirmPasswordField.text == nil || confirmPasswordField.text == "") {
            self.passwordField.attributedPlaceholder = NSAttributedString(string: "* Please enter a password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8284956813, green: 0, blue: 0, alpha: 1)])
        }
        else if passwordField.text != confirmPasswordField.text {
            self.passwordField.text = ""
            self.confirmPasswordField.text = ""
            self.passwordField.attributedPlaceholder = NSAttributedString(string: "* Passwords do not match", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8284956813, green: 0, blue: 0, alpha: 1)])
        } else if passwordField.text!.count < 6 {
            self.passwordField.text = ""
            self.confirmPasswordField.text = ""
            self.passwordField.attributedPlaceholder = NSAttributedString(string: "* Password must be at least 6 characters", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8284956813, green: 0, blue: 0, alpha: 1)])
        } else {
            // success
            // check if successfully passed to db
            RegistrationInfoService.instance.clearContent()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let startUsingVC = storyboard.instantiateViewController(withIdentifier: "startUsingVC")
            self.present(startUsingVC, animated: true, completion: nil)
        }
        
        // clear reginfoservice
        // present startusing
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
