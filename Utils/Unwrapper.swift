//
//  OptionalCrusher.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 06/07/2023.
//

import Foundation

class Unwrapper {
    
    static func unwrap<T>(_ optional: T?) -> T? {
        guard let unwrapped = optional else {
            return nil
        }
        return unwrapped
    }
}
