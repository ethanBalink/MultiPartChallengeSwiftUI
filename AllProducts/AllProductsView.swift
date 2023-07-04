//
//  CategoryView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation
import SwiftUI

struct AllProductsView: View {
    
    var category: String
    @ObservedObject var myAllProductsVM = AllProductsVM()
    var body: some View {
        if let productsArray = GeneralVM.shared.productArr {
            VStack {
                Button("Toggle Favorites", action: myAllProductsVM.sortFavs)
                    .padding()
                List(myAllProductsVM.listOfProducts) { product in
                    // TODO: make nice tiles in the future
                    SingleProductView(product: product)
                    
                }
                .onAppear {
                    
                    myAllProductsVM.getCategorieProductsFor(category, inArray: productsArray)
                    
                }
                
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
        AllProductsView(category: "smartphones")
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
