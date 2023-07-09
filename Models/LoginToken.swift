//
//  LoginToken.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation

struct LoginToken: Token, Codable {
    
    let token: String?
    let firstname: String?
    let lastname: String?
    
}

