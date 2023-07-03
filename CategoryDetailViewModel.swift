//
//  CategoryViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation
import SwiftUI
class CategorieDetailViewModel: ObservableObject {
    
    @Published var specificCategoryArr: [Product]?
    
    func getCategorieProductsFor(_ category: String, inArray unFilteredArr: [Product]) {
        var productArr: [Product] = []
        for product in unFilteredArr {
            if product.category == category {
                productArr.append(product)
            }
        }
        self.specificCategoryArr = productArr
        
    }
}
