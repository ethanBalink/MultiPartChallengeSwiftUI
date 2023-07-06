//
//  SearchVM.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 04/07/2023.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    
    @Published var filteredProducts: [Product] = []
    @Published var searchQuery = ""
    @Published var showFavs = false
    init() {
        getAllProducts()
    }
    
    func getAllProducts() {
        if let allProductsArr = GeneralVM.shared.productArr {
            filteredProducts = allProductsArr
        }
    }
    func filterProducts() {
        if let allProductsArr = GeneralVM.shared.productArr {
            
            if !searchQuery.isEmpty {
                filteredProducts = allProductsArr.filter {
                    let productTitleAndBrandWordsArr =  $0.title.lowercased().split(separator: " ") + $0.brand.lowercased().split(separator: " ")
                    for partOfWord in productTitleAndBrandWordsArr {
                        if partOfWord.hasPrefix(searchQuery.lowercased()) {
                            return true
                        }
                    }
                    return false
                }
            }
            
            else {
                
                getAllProducts()
                
            }
        }
    }
    
    func toggleFavorites() {
        if showFavs {
            if !filteredProducts.isEmpty {
                filteredProducts = filteredProducts.filter {
                    AllProductsVM.shared.savedFavorites.contains($0.id)
                }
            }
        }
        else {
            getAllProducts()
        }
        
        
    }
    
    
}

