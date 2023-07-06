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
    
    
    
    func signupButtonAction() {
        
        register(fname: firstName, lname: lastName, username: userName, password: password)
    }
    
    
    func register(fname: String, lname: String, username: String, password: String) {
        if (InputValidation.isValid(firstName, ofType: "name") && InputValidation.isValid(lastName, ofType: "name") && InputValidation.isValid(userName, ofType: "email") && InputValidation.isValid(password, ofType: "password")) {
            
            SignupAPI.registerAPI(fname: fname, lname: lname, username: username, password: password) { success, error in
                if success {
                    GeneralVM.shared.fetchProducts { success in
                        if success {
                            DispatchQueue.main.async {
                                self.showProgressBar = false
                                self.showNextView = true
                            }                        }// if success fetchProducts
                        else {
                            print("Unable to get products for some reason")
                            self.showProgressBar = false
                            
                        }
                    }
                }
                
            }
        }
        else {
            print("invalid input")
        }
    }
    
    
    
    
    
}
