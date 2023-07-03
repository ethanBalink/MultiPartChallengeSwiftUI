//
//  LoginViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 03/07/2023.
//

import Foundation

class LoginViewModel {

    func loginButtonAction(username: String, password: String,_ completion: @escaping (_ success: Bool) -> Void) {
        if ( InputValidation.inputIsValid(username, ofType: "email") && InputValidation.inputIsValid(password, ofType: "password")) {
            
            login(username: username,password: password) { success in
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
                }// if success login
                
            }// closure login
            
        }// if valid
        
    }// loginbutton func
    
    
    
    func login(username: String, password: String, _ completion: @escaping (_ success: Bool) -> Void) {
        LoginAPI.shared.loginAPI(username: username, password: password, {success,error in
            
            if success {
                    // TODO: save token in userdefaults
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
