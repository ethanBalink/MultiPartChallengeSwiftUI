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
        
        if !filteredProducts.isEmpty, !searchQuery.isEmpty {
            
            filteredProducts = filteredProducts.filter {
                $0.title
                    .hasPrefix(searchQuery)
            }
        }
        
        else {
            if let allProductsArr = GeneralVM.shared.productArr {
                
                filteredProducts = allProductsArr
                
            }
        }
    }
    
    
}

