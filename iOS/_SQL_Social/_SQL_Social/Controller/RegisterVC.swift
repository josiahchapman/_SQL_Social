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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        
        nextButton.layer.cornerRadius = 23
        
        if RegistrationInfoService.instance.firstName != "" {
            firstNameLabel.text = RegistrationInfoService.instance.firstName!
        }
        else {
            firstNameLabel.attributedPlaceholder = NSAttributedString(string: "First name", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
        }
        
        if RegistrationInfoService.instance.lastName != "" {
            lastNameLabel.text = RegistrationInfoService.instance.lastName!
        }
        else {
            lastNameLabel.attributedPlaceholder = NSAttributedString(string: "Last name", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
        }
        
        if RegistrationInfoService.instance.email != "" {
            emailLabel.text = RegistrationInfoService.instance.email!
        }
        else {
            emailLabel.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.768627451, blue: 0.1764705882, alpha: 1)])
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if (firstNameLabel.text != nil || firstNameLabel.text != "")
        && (lastNameLabel.text != nil || lastNameLabel.text != "")
            && (RegistrationInfoService.instance.isEmailValid(email: emailLabel.text)) {
            RegistrationInfoService.instance.configure(fName: firstNameLabel.text!, lName: lastNameLabel.text!, em: emailLabel.text!)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let completeRegisterVC = storyboard.instantiateViewController(withIdentifier: "completeRegisterVC")
            self.present(completeRegisterVC, animated: false, completion: nil)
        }
        else {
            if firstNameLabel.text == nil || firstNameLabel.text == "" {
                firstNameLabel.attributedPlaceholder = NSAttributedString(string: "* Please enter your first name", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8284956813, green: 0, blue: 0, alpha: 1)])
            }
            
            if lastNameLabel.text == nil || lastNameLabel.text == "" {
                lastNameLabel.attributedPlaceholder = NSAttributedString(string: "* Please enter your last name", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8284956813, green: 0, blue: 0, alpha: 1)])
            }
            
            if RegistrationInfoService.instance.isEmailValid(email: emailLabel.text) == false {
                emailLabel.attributedPlaceholder = NSAttributedString(string: "* Please enter a valid email address", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8284956813, green: 0, blue: 0, alpha: 1)])
            }
        }
        
    }
}
