//
//  CategoryViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation
import SwiftUI
class AllProductsVM: ObservableObject {
    
    @Published var savedProducts: [Product]?
    @Published var showingFavs = false
    @Published var savedFavorites: Set<Int> = [1, 7]
    private var db = FavoriteDB()
    init() {
        self.savedFavorites = db.load()
        
    }
    
    func getCategorieProductsFor(_ category: String, inArray unFilteredArr: [Product]) {
        var productArr: [Product] = []
        for product in unFilteredArr {
            if product.category == category {
                productArr.append(product)
            }
        }
        self.savedProducts = productArr
        
    }
    
    func sortFavs() {
        withAnimation() {
            showingFavs.toggle()
        }
    }
    
    var listOfProducts: [Product]  {
        if let currentProducts = savedProducts {
            if showingFavs {
                return currentProducts.filter { savedFavorites.contains($0.id) }
            }
            return currentProducts
        }
        else {
            return [Product]()
            
        }
        
    }
    
}
