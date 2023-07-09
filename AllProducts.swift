//
//  mainViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 29/06/2023.
//

import Foundation

class AllProducts {
    
    var productArr: [Product]?
    static let shared = AllProducts()

    func fetchProducts() async throws -> Bool {
        if let savedToken = UserDefaults.standard.object(forKey: "savedToken") as? String {
            do {
                let productArr = try await FetchProductsAPI.fetchProductsFromAPI(token: savedToken)
                self.productArr = productArr
                CategorieVM.shared.getSingleCategory(productArr: productArr) // adding categories to shared instance
                return true
            }
            catch {
                throw error
            }// completion
        }// if token exists
        return false
    }// func
}
