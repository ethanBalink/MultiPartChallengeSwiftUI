//
//  SearchView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 04/07/2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var myCategoryProductsVM = CategoryProductsVM.shared
    @StateObject var mySearchVM = SearchVM()
    
    var body: some View {
        
        VStack {
            
            List(mySearchVM.filteredProducts) { product in
              
                    if let id = product.id {
                        SingleProductView(isFavorite: myCategoryProductsVM.savedFavorites.contains(id), product: product, toggleFavorites: {
                            myCategoryProductsVM.changeFavStatus(product: product)
                        })
                        .environmentObject(myCategoryProductsVM)
                        
                    }
                }
                
                
            }
            
            .navigationTitle("All Products")
            .searchable(text: $mySearchVM.searchQuery,  placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Product Or Brand")
            .onChange(of: mySearchVM.searchQuery) { _ in
                mySearchVM.filterProducts()
            }
            .onChange(of: CategoryProductsVM.shared.savedFavorites) { _ in
                mySearchVM.toggleFavorites()
            }
            .toolbar {
                Button(action: {
                    withAnimation() {
                        mySearchVM.showFavs.toggle()
                        mySearchVM.toggleFavorites()
                    }
                }, label: {
                    Image(systemName:  mySearchVM.showFavs ? "star.slash.fill": "star.fill")
                })
            }
        }
        
        
    }



