//
//  CategoryViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation
import SwiftUI
class CategoryProductsVM: ObservableObject {
    
   @ObservedObject static var shared = CategoryProductsVM()
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
       
        self.savedFavorites = db.load()
        withAnimation() {
            showingFavs.toggle()
        }
    }
    
    var listOfProducts: [Product]  {
        if let currentProducts = savedProducts {
            if showingFavs {
                return currentProducts.filter {
                    if let id = Unwrapper.unwrap($0.id) {
                       return savedFavorites.contains(id)
                    }
                    else {
                        return false
                    }
                }
            }
            return currentProducts
        }
        else {
            return [Product]()
            
        }
        
    }
    
    func changeFavStatus(product: Product) {
        if let id = Unwrapper.unwrap(product.id) {
            
        
        if savedFavorites.contains(id) {
            savedFavorites.remove(id)
        } else {
            savedFavorites.insert(id)
        }
        db.save(items: savedFavorites)
    }
    }
    
}
