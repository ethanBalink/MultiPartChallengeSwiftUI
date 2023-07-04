//
//  CategriesView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 29/06/2023.
//

import SwiftUI
struct CategoriesView: View {
    var body: some View {
        if !CategorieVM.shared.categoriesArr.isEmpty {
            let categoriesArr = CategorieVM.shared.categoriesArr
            NavigationView {
                List(categoriesArr, id: \.self) { category in
                    
                    NavigationLink(destination: AllProductsView(category:category), label: {
                        
                        Text(category.capitalized)
                        
                    })
                    
                    
                    
                }
            }
        }
        else {
            Text("Nothing")
        }
    }
}


extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
