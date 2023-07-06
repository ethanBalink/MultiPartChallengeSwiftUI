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
        
        if (InputValidation.inputIsValid(firstName, ofType: "name") && InputValidation.inputIsValid(lastName, ofType: "name") && InputValidation.inputIsValid(userName, ofType: "email") && InputValidation.inputIsValid(password, ofType: "password")) {
            register(fname: firstName, lname: lastName, username: userName, password: password) { success in
                if success {
                    // TODO: change fetchproducts to different file
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
                    } // closure fetchProducts
                }// if success register
                
            }// closure register
            
        }// if validation
        else {
            print("invalid unput")
        }
    }// func signup
    
    
    func register(fname: String, lname: String, username: String, password: String,_ completion: @escaping (_ success: Bool) -> Void) {
        SignupAPI.shared.registerAPI(fname: fname, lname: lname, username: username, password: password, completion: { success, error in
            if success {
                    // TODO: change fetchproducts to different file
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
    
    
    
    
    
}
