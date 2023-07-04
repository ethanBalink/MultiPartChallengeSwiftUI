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
        if ( InputValidation.inputIsValid(userName, ofType: "email") && InputValidation.inputIsValid(password, ofType: "password")) {
            
            login(username: userName,password: password) { success in
                if success {
                    // TODO: change fetchproducts to different file
                    GeneralVM.shared.fetchProducts { success in
                        if success {
                            DispatchQueue.main.async {
                                self.showProgressBar = false
                                self.showNextView = true
                            }
                            
                        }// if success fetchProducts
                        else {
                            print("Unable to get products for some reason")
                            self.showProgressBar = false
                        }
                    } // closure fetchProducts
                }// if success login
                
            }// closure login
            
        }// if valid
        
    }// loginbutton func
    
    
    
    func login(username: String, password: String, _ completion: @escaping (_ success: Bool) -> Void) {
        LoginAPI.shared.loginAPI(username: username, password: password, {success,error in
            
            if success {
                completion(true)
            }
            
            else if error != nil {
                print(error ?? "")
                completion(false)
            }
            else {
                print("mistake")
                completion(false)
            }
        })
        
    }
}// class
