//
//  SearchVM.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 04/07/2023.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    
    @Published var filteredProducts:[Product] = []
    @Published var searchQuery = ""
    init() {
        if let allProductsArr = GeneralVM.shared.productArr {
            filteredProducts = allProductsArr
        }
    }
    
    func filterProducts() {
        if let allProductsArr = GeneralVM.shared.productArr {
            
            if !searchQuery.isEmpty {
                filteredProducts = allProductsArr.filter {
                    var productTitleWordsArr =  $0.title.lowercased().split(separator: " ")
                    for partOfTitle in productTitleWordsArr {
                        if partOfTitle.hasPrefix(searchQuery.lowercased()) {
                            return true
                        }
                    }
                    return false
                }
            }
            
            else {
                
                filteredProducts = allProductsArr
                
            }
        }
    }
    
    
}

