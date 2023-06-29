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
    
    func registerAPI(fname: String, lname: String, username: String, pwd: String, completion: @escaping (_ success: Bool, _ data:String?,  _ error:Error?) -> Void) {
        
        if let url = URL(string: "https://balink.onlink.dev/register") {
            
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
                if let recievedToken = data {
                    if let convertedToken = String(data: recievedToken, encoding: .utf8) {
                        completion(true, convertedToken, nil)
                    }
                    
                } else {
                    completion(false, nil, error)
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
