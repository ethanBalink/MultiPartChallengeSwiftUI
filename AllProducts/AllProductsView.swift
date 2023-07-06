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
    @ObservedObject var mainAllProductsVM = AllProductsVM.shared
    
    var body: some View {
        if let productsArray = GeneralVM.shared.productArr {
            NavigationView {
                
                List(mainAllProductsVM.listOfProducts) { product in
                    // TODO: make nice tiles in the future
                    SingleProductView(isFavorite: mainAllProductsVM.savedFavorites.contains(product.id), product: product)
                        .environmentObject(mainAllProductsVM)
                    
                }
                .onAppear {
                    
                    mainAllProductsVM.getCategorieProductsFor(category, inArray: productsArray)
                    
                }
                
            }
            .navigationTitle(category.capitalized)
            .toolbar {
                Button(action: mainAllProductsVM.sortFavs, label: {
                    Image(systemName:  mainAllProductsVM.showingFavs ? "star.slash.fill": "star.fill")
                })
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
