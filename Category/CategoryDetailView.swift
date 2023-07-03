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
    @ObservedObject var myCategoryDetailViewModel = CategorieDetailViewModel()
    var body: some View {
        if let productsArray = GeneralVM.shared.productArr {
            List(myCategoryDetailViewModel.specificCategoryArr ?? []) { product in
                // TODO: make nice tiles in the future
                   SingleProductView(product: product)
                
            }
            .onAppear {
                
            myCategoryDetailViewModel.getCategorieProductsFor(category, inArray: productsArray)
                
            }
                
            }
         else {
            Text("no products to show")
             Image(systemName: "star")
                 .foregroundColor(.yellow)
        }
    }
    
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(category: "smartphones")
    }
}

// MARK: if for starimage

//if true {//product is a favorute
//    Image(systemName: "star.filled")
//        .foregroundColor(.)
//}
//else {
//    Image(systemName: "star")
//        .onTapGesture {
//            print("tapped")
//        }
//}
