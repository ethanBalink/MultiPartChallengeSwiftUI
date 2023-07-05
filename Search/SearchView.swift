//
//  SearchView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 04/07/2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var mainAllProductsVM = AllProductsVM.shared
    
    @StateObject var mySearchVM = SearchVM()
    
    var body: some View {
        VStack {
            
            List(mySearchVM.filteredProducts) { product in
                // TODO: make nice tiles in the future
                SingleProductView(isFavorite: mainAllProductsVM.savedFavorites.contains(product.id), product: product)
                    .environmentObject(mainAllProductsVM)
                
            }
        }
        .searchable(text: $mySearchVM.searchQuery, placement: .navigationBarDrawer, prompt: "Search Product")
        .onChange(of: mySearchVM.searchQuery) { _ in
            mySearchVM.filterProducts()
        }
        
//        .onSubmit(of: .search) {
//            mySearchVM.filterProducts()
//        }
        
    }
    
    
    
}