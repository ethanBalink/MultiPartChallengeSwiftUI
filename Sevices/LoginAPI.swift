//
//  LoginAPI.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation

class LoginAPI {
    
    static var shared = LoginAPI()
    var token: String = ""
    func loginAPI(username: String, password: String,_ completion:@escaping (_ success: Bool, _ data:String?,  _ error:Error?) -> Void) {
        
        if let url = URL(string: "https://balink.onlink.dev/users/login") {
            
            
            let userCred: [String: Any] = [
                "username": username,
                "password": password
            ]
            let userConverted = try? JSONSerialization.data(withJSONObject: userCred)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = userConverted
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let recievedData = data {
                    let loginTokenStruct = try? JSONDecoder().decode(LoginToken.self, from: recievedData)
                    if let convertedToken = loginTokenStruct?.token {
                        self.token = convertedToken
                        completion(true, convertedToken, nil)
                    }
                    
                }
                else {
                    completion(false, nil, error)
                    print("There was an error in registration")
                }
            }.resume()
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
