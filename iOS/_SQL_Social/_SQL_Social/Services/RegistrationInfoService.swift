//
//  RegistrationInfoService.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 4/9/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import Foundation

class RegistrationInfoService {
    static let instance = RegistrationInfoService()
    
    private var _firstName: String?
    private var _lastName: String?
    private var _email: String?
    
    public var firstName: String? {
        return _firstName
    }
    
    public var lastName: String? {
        return _lastName
    }
    
    public var email: String? {
        return _email
    }
    
    public func configure(fName: String, lName: String, em: String) {
        self._firstName = fName
        self._lastName = lName
        self._email = em
    }
    
    public func isEmailValid(email: String?) -> Bool {
        // Handles empty input
        if email == "" || email == nil {
            return false
        }
        
        let checkIfAtSym = Array(email!)
        if checkIfAtSym[0] == "@" {
            return false
        }
        
        var isAtSym = false
        for c in checkIfAtSym {
            if c == "@" {
                isAtSym = true
            }
        }
        
        if isAtSym {
            let splitAtSym = email!.split(separator: "@")
            if splitAtSym.count > 2 {
                return false
            }
            else {
                let checkIfDot = Array(splitAtSym[1])
                if checkIfDot[checkIfDot.count-1] == "." {
                    return false
                }
                
                var isDot = false
                for c in checkIfDot {
                    if c == "." {
                        isDot = true
                    }
                }
                return isDot
            }
        }
        else {
            return false
        }
    }
}
