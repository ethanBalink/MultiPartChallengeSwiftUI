//
//  LoginAPI.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation
import Combine

class LoginAPI {
    
    static var shared = LoginAPI()
    
    func loginAPI(username: String, password: String) async throws -> Bool {
        
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
            
            return try await withCheckedThrowingContinuation { continuation in
                URLSession.shared.dataTask(with: request) { data1, response, error in
                    do {
                        if let recievedData = data1 {
                            let loginTokenStruct = try JSONDecoder().decode(LoginToken.self, from: recievedData)
                            UserDefaults.standard.set(loginTokenStruct.token, forKey: "savedToken")
                            continuation.resume(returning: true)
                        }
                    }
                    catch {
                        continuation.resume(throwing: error)
                    }
                }.resume()
                
                
            }
        }
        return false
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
