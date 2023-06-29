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
                List(categoriesArr, id: \.self) { category in
                    Text(category)
                }
            } else {
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
