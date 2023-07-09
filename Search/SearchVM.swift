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
        if let allProductsArr = AllProducts.shared.productArr {
            filteredProducts = allProductsArr
        }
    }
    
    func filterProducts() {
        if let allProductsArr = AllProducts.shared.productArr {
            if !searchQuery.isEmpty {
                filteredProducts = allProductsArr.filter {
                    if let title = $0.title, let brand = $0.brand {
                        let productTitleAndBrandWordsArr =  title.lowercased().split(separator: " ") + brand.lowercased().split(separator: " ")
                        
                    for partOfWord in productTitleAndBrandWordsArr {
                        
                        if partOfWord.hasPrefix(searchQuery.lowercased()) {
                            return true
                        }
                    }
                    return false
                }
                    else {
                        return false
                    }
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
                    if let id = $0.id {
                        return CategoryProductsVM.shared.savedFavorites.contains(id)
                    }
                    else {
                        return false
                    }
                }
            }
        }
        else {
            getAllProducts()
        }
        
    }
    }
    
    


