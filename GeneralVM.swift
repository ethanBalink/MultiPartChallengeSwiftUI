//
//  mainViewModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 29/06/2023.
//

import Foundation
class GeneralVM {
    
    var productArr: [Product]?
    static let shared = GeneralVM()
    
    
    
    // TODO: move fetchproducts func to seperate file
    
    func fetchProducts(_ completion: @escaping (_ success: Bool) -> Void) {
        if let savedToken = UserDefaults.standard.object(forKey: "savedToken") as? String {
            FetchProductsAPI.fetchProductsFromAPI(token: savedToken) { productArr in
                if let recievedProducts = productArr {
                    self.productArr = recievedProducts
                    CategorieVM.shared.getSingleCategory(productArr: recievedProducts) // adding categories to shared instance
                    completion(true)
                }
                else {
                    completion(false)
                }
                
                
            }// completion
        }// if token exists
    }// func
    
    
   
    
}
