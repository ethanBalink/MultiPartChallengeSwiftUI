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
            if let productCategory = Unwrapper.unwrap(product.category) {
                if !(self.categoriesArr.contains(productCategory)) {
                    self.categoriesArr.append(productCategory)
                }
            }
        }
    }
}
    extension String: Identifiable {
        public typealias ID = Int
        public var id: Int {
            return hash
        }
    }
    
    

