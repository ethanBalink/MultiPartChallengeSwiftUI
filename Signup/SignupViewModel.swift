//
//  SignupViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 03/07/2023.
//

import Foundation

class SignupViewModel {
    
    func register(fname: String, lname: String, username: String, pwd: String,_ completion: @escaping (_ success: Bool) -> Void) {
        SignupAPI.shared.registerAPI(fname: fname, lname: lname, username: username, password: pwd, completion: { success, error in
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
    
    func signupButtonAction(fname: String, lname: String, username: String, pwd: String,_ completion: @escaping (_ success: Bool) -> Void) {
        
        if (InputValidation.inputIsValid(fname, ofType: "name") && InputValidation.inputIsValid(lname, ofType: "name") && InputValidation.inputIsValid(username, ofType: "email") && InputValidation.inputIsValid(pwd, ofType: "password")) {
            register(fname: fname, lname: lname, username: username, pwd: pwd) { success in
                if success {
                    // TODO: change fetchproducts to different file
                    GeneralVM.shared.fetchProducts { success in
                        if success {
                            completion(true)
                        }// if success fetchProducts
                        else {
                            completion(false)
                        }
                    } // closure fetchProducts
                }// if success register
                
            }// closure register
            
        }// if validation
        else {
            print("invalid unput")
        }
    }// func signup
    
    
    
    
    
}
