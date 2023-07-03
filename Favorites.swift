//
//  Favorites.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 03/07/2023.
//

import UIKit

class Favorites: ObservableObject {
    
   
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = [1, 3]
    private var db = FavoriteDB()
    
    init() {
        self.savedItems = db.load()
    }
    
    func changeFavStatus(product: Product) {
        
        if savedItems.contains(product.id) {
              savedItems.remove(product.id)
        } else {
              savedItems.insert(product.id)
        }
        db.save(items: savedItems)
    }
}

