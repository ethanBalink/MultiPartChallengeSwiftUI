//
//  Favorites.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 03/07/2023.
//

import UIKit

class Favorites: ObservableObject {
    
    
    
    init() {
        self.savedItems = db.load()
    }
    
    
}

