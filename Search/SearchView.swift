//
//  SearchView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 04/07/2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var mainAllProductsVM = AllProductsVM.shared
    @State var searchQuery = ""
    @State var filteredProducts:[Product] = []
    
    var body: some View {
        VStack {
            
            List(filteredProducts) { product in
                // TODO: make nice tiles in the future
                SingleProductView(isFavorite: mainAllProductsVM.savedFavorites.contains(product.id), product: product)
                    .environmentObject(mainAllProductsVM)
                
                
                
            }
        }
        .searchable(text: $searchQuery, prompt: "Search Product"
        )
        .onChange(of: searchQuery) { _ in
            filterProducts()
        }
        
        .onSubmit(of: .search) {
            filterProducts()
        }
        .onAppear(perform: {
            if let allProductsArr = GeneralVM.shared.productArr {
                filteredProducts = allProductsArr
            }})
        
    }
    
    func filterProducts() {
        if let allProductsArr = GeneralVM.shared.productArr {
            if !searchQuery.isEmpty {
                
                filteredProducts = allProductsArr.filter {
                    $0.title
                        .localizedCaseInsensitiveContains(searchQuery)
                }
            }
            
            else {
                
                filteredProducts = allProductsArr
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
