//
//  SigninAPI.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 28/06/2023.
//

import Foundation
class SigninAPI {
    
    static var shared = SigninAPI()
    
    var token: String = ""
    
    func register(fname: String, lname: String, username: String, pwd: String, completion: @escaping (_ succes:Bool, _ error:Bool) -> Void) {
        
        guard let url = URL(string: "https://balink.onlink.dev/register")
        else {
            return
        }
        
        let userCred: [String: Any] = [
            "firstname": fname,
            "lastname": lname,
            "username": username,
            "password": pwd
        ]
        
        let convertedToJson = try? JSONSerialization.data(withJSONObject: userCred)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = convertedToJson
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                self.token = String(data: data, encoding: .utf8) ?? ""
                completion(true, false)
            } else {
                print("There was an error")
            }
        }.resume()
    }// register func
    
}// class
