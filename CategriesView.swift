//
//  CategriesView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 29/06/2023.
//

import SwiftUI
struct CategoriesView: View {
    @State private var a = false
    var body: some View {
        if !CategorieVM.shared.categoriesArr.isEmpty {
            
            let categoriesArr = CategorieVM.shared.categoriesArr
            NavigationView {
                List(categoriesArr, id: \.self) { category in
                    
                    NavigationLink(destination: CategoryDetailView(category:category), label: {
                        
                        Text(category)
                        
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
