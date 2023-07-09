//
//  FetchProductsAPI.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 06/07/2023.
//

import Foundation
import Combine
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
    
    
//
//
//
//   static func fetchProducts2(token: String) -> AnyPublisher<[Product], Error> {
//        // make if let url
//        let url = URL(string: "https://balink.onlink.dev/products")!
//
//        var request = URLRequest(url: url)
//        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .map { $0.data }
//            .decode(type: [Product].self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//
//    }
//
//    let subscriber = Subscribers.Sink<[Product], Error>(receiveCompletion: { completion in
//        switch completion {
//        case .finished:
//            print("succes")
//        case .failure(let error):
//            print("there was an error", error)
//        }
//    }, receiveValue: { products in
//        for product in products {
//            print(product.title ?? "")
//        }
//    })
//
//
//   static func doit() {
//       _ = fetchProducts2(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpkamR0QGdnLmlpIiwicGFzc3dvcmQiOiJlYjExIiwiaWF0IjoxNjg4ODg5OTc3fQ.Klh0iO9WNehDmYm23iauw9TW7nNPxZ0mplYwVA6qNq0").sink(receiveCompletion: { _ in
//           print("completion succes")
//       }, receiveValue: { _ in
//           print("recieved succes")
//       })
//
//    }
//    
}
