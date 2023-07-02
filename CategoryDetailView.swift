//
//  CategoryView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation
import SwiftUI

struct CategoryDetailView: View {
    
    var category: String
    var body: some View {
        if let arr = GeneralVM.shared.productArr {
            
            
            List(arr) { product in
                if product.category == category{
                    Text(product.title)
                    Text(product.category)
                }
                
            }
        } else {
            Text("kkk")
        }
    }
    
}
