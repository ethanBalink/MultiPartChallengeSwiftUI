//
//  SigninAPI.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 28/06/2023.
//

import Foundation

class SignupAPI {
    
    static func registerAPI(fname: String, lname: String, username: String, password: String, completion: @escaping (_ success: Bool, _ error:Error?) -> Void) {
        
        if let url = URL(string: "https://balink.onlink.dev/users/register") {
            
            let userCred: [String: Any] = [
                "firstname": fname,
                "lastname": lname,
                "username": username,
                "password": password
            ]
            
            let convertedToJson = try? JSONSerialization.data(withJSONObject: userCred)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = convertedToJson
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                do {
                    if let recievedData = data {
                        let tokenStruct = try JSONDecoder().decode(RegisterToken.self, from: recievedData)
                        UserDefaults.standard.set(tokenStruct.token, forKey: "savedToken")
                        completion(true, nil)
                    }
                    
                }
                
                catch {
                    completion(false, error)
                }
            }
            .resume()
        }}
    
}// class
