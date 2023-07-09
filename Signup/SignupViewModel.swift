//
//  SignupViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 03/07/2023.
//

import Foundation

class SignupViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var showProgressBar = false
    @Published var showNextView = false
    
    
    
    func signupButtonAction() async {
        
        await register(fname: firstName, lname: lastName, username: userName, password: password)
    }
    
    
    func register(fname: String, lname: String, username: String, password: String) async {
        if (InputValidation.isValid(firstName, ofType: "name") && InputValidation.isValid(lastName, ofType: "name") && InputValidation.isValid(userName, ofType: "email") && InputValidation.isValid(password, ofType: "password")) {
            do {
                let _ = try await SignupAPI.registerAPI(fname: fname, lname: lname, username: username, password: password)
                let _ = try await  AllProducts.shared.fetchProducts
                
                DispatchQueue.main.async {
                    self.showProgressBar = false
                    self.showNextView = true
                }
                
            }// if success fetchProducts
            
            catch {
                print("Unable to get products for some reason")
                self.showProgressBar = false
                
            }
        }
    }
    
}
