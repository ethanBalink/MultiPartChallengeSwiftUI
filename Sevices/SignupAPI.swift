//
//  SigninAPI.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 28/06/2023.
//

import Foundation
class SignupAPI {
    
    static var shared = SignupAPI()
    
    var token: String = ""
    
    func registerAPI(fname: String, lname: String, username: String, password: String, completion: @escaping (_ success: Bool, _ error:Error?) -> Void) {
        
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
                if let recievedData = data {
                    let tokenStruct = try? JSONDecoder().decode(RegisterToken.self, from: recievedData)
                    if let convertedToken = tokenStruct?.token {
                        // save in userdefaults
                        UserDefaults.standard.set(convertedToken, forKey: "savedToken")
                        completion(true, nil)
                    }
                    
                }
                else {
                    completion(false, error)
                    print("There was an error in registration")
                }
            }.resume()
        }}
    
    
    func fetchProductsFromAPI(token: String, completion: @escaping (_ productArr: [Product]?) -> Void) {
        if let url = URL(string: "https://balink.onlink.dev/products") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                do {
                    if let recievedProductsArr = data {
                        let decodedArr = try JSONDecoder().decode([Product].self, from: recievedProductsArr)
                        completion(decodedArr)
                    }
                } catch {
                    
                    completion(nil)
                }
            }.resume()
        }
        
    }// func
    
    
}// class
