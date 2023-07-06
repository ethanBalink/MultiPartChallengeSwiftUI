//
//  FetchProductsAPI.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 06/07/2023.
//

import Foundation

class FetchProductsAPI {
    
   static func fetchProductsFromAPI(token: String,_ completion: @escaping (_ productArr: [Product]?) -> Void) {
        if let url = URL(string: "https://balink.onlink.dev/products") {
            
            var request = URLRequest(url: url)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                do {
                    if let recievedProductsArr = data {
                        let decodedArr = try JSONDecoder().decode([Product].self, from: recievedProductsArr)
                        completion(decodedArr)
                    }
                } catch {
                    
                    completion(nil)
                }
            }.resume()
        }
        
    }// func
}
