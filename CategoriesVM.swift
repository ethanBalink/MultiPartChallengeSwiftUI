//
//  CategoriesVM.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 29/06/2023.
//

import Foundation

class CategorieVM {
    static let shared = CategorieVM()
    var categoriesArr: [String] = []
    
    func getSingleCategory(productArr:[Product]) {
        for product in productArr {
            if !(self.categoriesArr.contains(product.category)) {
                self.categoriesArr.append(product.category)
            }
        }
    }
    
}
