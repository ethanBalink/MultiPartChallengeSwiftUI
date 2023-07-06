//
//  inputValidation.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 29/06/2023.
//

import Foundation

class InputValidation {
    static func isValid(_ dynamicVariable: Any, ofType: String) -> Bool {
        switch ofType {
        case "email":
            guard let email = dynamicVariable as? String else {
                return false
            }
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
            
        case "password":
            guard let password = dynamicVariable as? String else {
                return false
            }
            let passwordRegEx = "^[^\\s]+$"
            let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            return passwordPred.evaluate(with: password)
            
        case "name":
            guard let name = dynamicVariable as? String else {
                return false
            }
            return !name.isEmpty
            
        default:
            return false
        }
    }
    
}

