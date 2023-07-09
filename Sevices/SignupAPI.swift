//
//  SigninAPI.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 28/06/2023.
//

import Foundation

class SignupAPI {
    
    static func registerAPI(fname: String, lname: String, username: String, password: String) async throws -> Bool {
        
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
            
            return try await withCheckedThrowingContinuation { continuation in
                URLSession.shared.dataTask(with: request) { data1, response, error in
                    do {
                        if let recievedData = data1 {
                            let tokenStruct = try JSONDecoder().decode(RegisterToken.self, from: recievedData)
                            UserDefaults.standard.set(tokenStruct.token, forKey: "savedToken")
                            continuation.resume(returning: true)
                        }
                        
                    }
                    
                    catch {
                        continuation.resume(throwing: error)
                    }
                }
                .resume()
            }
        }
        return false
    }
    
}// class
