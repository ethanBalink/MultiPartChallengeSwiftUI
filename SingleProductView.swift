//
//  SingleProductView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 03/07/2023.
//

import SwiftUI
import Combine

struct SingleProductView: View {
    var isFavorite:Bool
    var product: Product
    @ObservedObject var mainAllProductsVM = AllProductsVM.shared
    var body: some View {
        HStack {
            titleColumn()
                .frame(maxWidth: .infinity)
            descriptionColumn()
                .frame(maxWidth: .infinity)
            thumbnailColumn()
            
        }
        .padding(.horizontal)
        .cornerRadius(10)
        
    }
    
    @ViewBuilder
    private func thumbnailColumn() -> some View {
        VStack {
            
            AsyncImage(url: product.thumbnail,scale: 5)
                .cornerRadius(10)
            
            Text("$\(product.price)")
                .foregroundColor(.green)
            
        }
        
    }
    
    @ViewBuilder
    private func titleColumn() -> some View {
        VStack(alignment: .leading, spacing: 6.0) {
            
            Text(product.brand)
                .fontWeight(.light)
            Text(product.title)
                .font(.headline)
            
            Image(systemName: isFavorite ? "star.fill":"star")
                .onTapGesture {
                    mainAllProductsVM.changeFavStatus(product: product)
                }
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.yellow)
                .padding(.leading)
            
            
        }
        
    }
    
    @ViewBuilder
    private func descriptionColumn() -> some View {
        VStack (alignment: .leading, spacing: 6.0) {
            
            Text(product.description)
                .font(.subheadline)
                .lineLimit(4)
            
        }
        
    }
}







struct SingleProductView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(
            id: 3,
            title: "iPhone 9",
            description: "An apple mobile which is nothing like applegfgnhgbfdbljrgdfogiurevngiufvgoiufovginugupniuvmphfguhnvtmrvgrtovhutm0hvp9rtumhvt09hyt0vh8yrmvh098tryhmrtv08htm0vh8tmvh08rtmyvh08rtvhmyrt80hvmyrt8vhimy08rhmvt8mh8hmv8hmy08vhmv08hmrtvy08mrt08hvm08tm80vhyvm80hvm80vmy80ym0ymyvhm0u0mrhtmhtvm8900",
            price: 549,
            discountPercentage: 12.96,
            rating: 4.69,
            stock: 94,
            brand: "Apple",
            category: "smartphones",
            thumbnail: URL(string: "https://i.dummyjson.com/data/products/1/thumbnail.jpg")!,
            images: [URL(string: "https://i.dummyjson.com/data/products/1/1.jpg")!]
        )
        
        return SingleProductView(isFavorite: false, product: product)
            .environmentObject(AllProductsVM())
    }
}

