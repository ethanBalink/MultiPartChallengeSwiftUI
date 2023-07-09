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
    @ObservedObject var myCategoryProductsVM = CategoryProductsVM.shared
    
    var body: some View {
        if let productsArray = AllProducts.shared.productArr {
            
            NavigationView {
                
                List(myCategoryProductsVM.listOfProducts) { product in
                    // TODO: make nice tiles in the future
                    if let id = product.id {
                        
                        SingleProductView(isFavorite: myCategoryProductsVM.savedFavorites.contains(id), product: product, toggleFavorites: {
                            myCategoryProductsVM.toggleFavorites(of: product)
                        }
                        )
                            .environmentObject(myCategoryProductsVM)
                    }
                    
                }
                .onAppear {
                    
                    myCategoryProductsVM.getCategorieProductsFor(category, inArray: productsArray)
                    
                }
                
            }
            .navigationTitle(category.capitalized)
            .toolbar {
                Button(action: myCategoryProductsVM.sortFavs, label: {
                    Image(systemName:  myCategoryProductsVM.showingFavs ? "star.slash.fill": "star.fill")
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
