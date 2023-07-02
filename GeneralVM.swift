//
//  mainViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 29/06/2023.
//

import Foundation
class GeneralVM {
    
    var token: String?
    var productArr: [Product]?
    static let shared = GeneralVM()
    
    func register(fname: String, lname: String, username: String, pwd: String,_ completion: @escaping (_ success: Bool) -> Void) {
        SignupAPI.shared.registerAPI(fname: fname, lname: lname, username: username, pwd: pwd, completion: { success, data, error in
            if success {
                if let recievedToken = data {
                    self.token = recievedToken
                    //print(self.token)
                    completion(true)
                }
                
            } else if error != nil {
                print(error ?? "")
                completion(false)
            }
            else {
                print("mistake")
                completion(false)
            }
        })
    }
    
    // TODO: move fetchproducts func to seperate file
    
    func fetchProducts(_ completion: @escaping (_ success: Bool) -> Void) {
        if let existingToken = self.token {
            SignupAPI.shared.fetchProductsFromAPI(token: existingToken, completion: { productArr in
                if let recievedProducts = productArr {
                    self.productArr = recievedProducts
                    CategorieVM.shared.getSingleCategory(productArr: recievedProducts) // adding categories to shared instance
                    completion(true)
                }
                else {
                    completion(false)
                }
                
                
            }// completion
            )// func args
        }// if token exists
    }// func
    
    
    func signupButtonAction(fname: String, lname: String, username: String, pwd: String,_ completion: @escaping (_ success: Bool) -> Void) {
        
        if (InputValidation.inputIsValid(fname, ofType: "name") && InputValidation.inputIsValid(lname, ofType: "name") && InputValidation.inputIsValid(username, ofType: "email") && InputValidation.inputIsValid(pwd, ofType: "password")) {
            register(fname: fname, lname: lname, username: username, pwd: pwd) { success in
                if success {
                    self.fetchProducts { success in
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
    
    func loginButtonAction(username: String, password: String,_ completion: @escaping (_ success: Bool) -> Void) {
        if ( InputValidation.inputIsValid(username, ofType: "email") && InputValidation.inputIsValid(password, ofType: "password")) {
            
            login(username: username,password: password) { success in
                if success {
                    self.fetchProducts { success in
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
        
        
        
    }//func loginButtonAction
    
    
    func login(username: String, password: String, _ completion: @escaping (_ success: Bool) -> Void) {
        LoginAPI.shared.loginAPI(username: username, password: password, {success,data,error in
            
            if success {
                if let recievedToken = data {
                    self.token = recievedToken
                    //print(self.token)
                    completion(true)
                }
                
            } else if error != nil {
                print(error ?? "")
                completion(false)
            }
            else {
                print("mistake")
                completion(false)
            }
        })
        
    } // func login
}
