//
//  RegisterVC.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 4/9/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var optionalErrorLabel: UILabel!
    
    private var nextError: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        
        nextButton.layer.cornerRadius = 23
        
        if RegistrationInfoService.instance.firstName != nil {
            firstNameLabel.text = RegistrationInfoService.instance.firstName!
        }
        else {
            firstNameLabel.attributedPlaceholder = NSAttributedString(string: "First name", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
        }
        
        if RegistrationInfoService.instance.lastName != nil {
            lastNameLabel.text = RegistrationInfoService.instance.lastName!
        }
        else {
            lastNameLabel.attributedPlaceholder = NSAttributedString(string: "Last name", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
        }
        
        if RegistrationInfoService.instance.email != nil {
            emailLabel.text = RegistrationInfoService.instance.email!
        }
        else {
            emailLabel.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        var isFirstNameValid = true
        var isLastNameValid = true
        var isEmailValid = true
        
        if (firstNameLabel.text != nil || firstNameLabel.text != "")
        && (lastNameLabel.text != nil || lastNameLabel.text != "")
            && RegistrationInfoService.instance.isEmailValid(email: emailLabel.text) {
            
        }
        else {
            if firstNameLabel.text == nil || firstNameLabel.text == "" {
                isFirstNameValid = false
            }
            
            if lastNameLabel.text == nil || lastNameLabel.text == "" {
                isLastNameValid = false
            }
            
            if RegistrationInfoService.instance.isEmailValid(email: emailLabel.text) == false {
                isEmailValid = false
            }
            
            if !isFirstNameValid {
                if !isLastNameValid {
                    if !isEmailValid {
                        self.nextError = "Please enter your first and last name and a valid email."
                    }
                    else {
                        self.nextError = "Please enter your first and last name."
                    }
                }
                else if !isEmailValid {
                    self.nextError = "Please enter your first name and a valid email."
                }
                else {
                    self.nextError = "Please enter your first name."
                }
            }
            else if !isLastNameValid {
                if !isEmailValid {
                    self.nextError = "Please enter your last name and a valid email."
                }
                else {
                    self.nextError = "Please enter your last name."
                }
            }
            else if !isEmailValid {
                self.nextError = "Please enter a valid email."
            }
        }
        
        if nextError != nil {
            optionalErrorLabel.isHidden = false
            optionalErrorLabel.text = nextError!
        }
    }
}
