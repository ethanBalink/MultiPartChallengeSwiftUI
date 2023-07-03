 //
//  ProductModel.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 29/06/2023.
//

import Foundation

struct Product: Codable, Identifiable {
    
    let id: Int
    let title: String
    let description: String
    let  price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: URL
    let images: [URL]
}
