//
//  LoginViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 03/07/2023.
//

import Foundation
import SwiftUI
class LoginViewModel: ObservableObject {
    
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var showNextView = false
    @Published var showProgressBar = false
    
    func loginButtonAction() async {
        
        await login(username: userName,password: password)
    }
    
    
    
    func login(username: String, password: String) async {
        if ( InputValidation.isValid(userName, ofType: "email") && InputValidation.isValid(password, ofType: "password")) {
            do {
                let _ = try await LoginAPI.shared.loginAPI(username: username, password: password)
                let _ =  try await  AllProducts.shared.fetchProducts()
                
                DispatchQueue.main.async {
                    self.showNextView = true
                    self.showProgressBar = false
                }
            }
            catch {
                print("Not work")
            }
        }
    }
}
