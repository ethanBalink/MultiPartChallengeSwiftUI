//
//  CategoryViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation
import SwiftUI
class AllProductsVM: ObservableObject {
   @ObservedObject static var shared = AllProductsVM()
    @Published var savedProducts: [Product]?
    @Published var showingFavs = false
    @Published var savedFavorites: Set<Int> = []
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
        //print(self.savedFavorites)
        self.savedFavorites = db.load()
        withAnimation() {
            showingFavs.toggle()
        }
    }
    
    var listOfProducts: [Product]  {
        if let currentProducts = savedProducts {
            if showingFavs {
                print(self.savedFavorites)
                return currentProducts.filter { savedFavorites.contains($0.id) }
            }
            return currentProducts
        }
        else {
            return [Product]()
            
        }
        
    }
    
    func changeFavStatus(product: Product) {
        
        if savedFavorites.contains(product.id) {
            savedFavorites.remove(product.id)
        } else {
            savedFavorites.insert(product.id)
        }
        db.save(items: savedFavorites)
    }
    
}
