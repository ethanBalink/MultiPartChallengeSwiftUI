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
    
    func loginButtonAction() {
        
        login(username: userName,password: password)
    }
    
    
    
    func login(username: String, password: String) {
        if ( InputValidation.inputIsValid(userName, ofType: "email") && InputValidation.inputIsValid(password, ofType: "password")) {
            LoginAPI.shared.loginAPI(username: username, password: password) { success,error in
                
                if success {
                    GeneralVM.shared.fetchProducts { success in
                        if success {
                            DispatchQueue.main.async {
                                self.showNextView = true
                            }
                            
                        }// if success fetchProducts
                        else {
                            print("Unable to get products for some reason")
                            DispatchQueue.main.async {
                                self.showProgressBar = false
                            }
                            
                        }
                    }
                } else {
                    print("unable to login for some reason")
                }
            }
            
        }
        else {
            print("invalid input")
        }
        
    }
}
