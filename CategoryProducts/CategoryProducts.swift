//
//  CategoryView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import Foundation
import SwiftUI

struct CategoryProducts: View {
    
    var category: String
    @ObservedObject var mainAllProductsVM = CategoryProductsVM.shared
    
    var body: some View {
        if let productsArray = GeneralVM.shared.productArr {
            
            NavigationView {
                
                List(mainAllProductsVM.listOfProducts) { product in
                    // TODO: make nice tiles in the future
                    if let id = Unwrapper.unwrap(product.id) {
                        
                        SingleProductView(isFavorite: mainAllProductsVM.savedFavorites.contains(id), product: product, toggleFavorites: {
                            mainAllProductsVM.changeFavStatus(product: product)
                        }
                        )
                            .environmentObject(mainAllProductsVM)
                    }
                    
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
            Text("No Products In Category 😔")
        }
        
    }
    
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProducts(category: "smartphones")
    }
}
