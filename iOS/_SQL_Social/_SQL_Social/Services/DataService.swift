//
//  DataService.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 5/9/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import Foundation

struct ProfileInformation: Decodable {
    let passwordHash: String
    
    init(json: [String: Any]) {
        passwordHash = json["PASSWORD_HASH"] as? String ?? "s"
    }
}

let DB_BASE = "https://localhost:5000"

class DataService {
    static let instance = DataService()
    
    func getProfileInformation(userEmail: String) {
        print("YO")
        let url = URL(string: DB_BASE + "/getProfileInformation-" + userEmail)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                // error
            } else {
                // no error
                
                //let dataAsString = String(data: data!, encoding: .utf8)
                
                do {
                    let profileInformation = try JSONDecoder().decode(ProfileInformation.self, from: data!)
                    print(profileInformation.passwordHash)
                } catch let jsonErr {
                    print(jsonErr)
                }
            }
        }.resume()
    }
}
