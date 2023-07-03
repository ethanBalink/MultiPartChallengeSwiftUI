//
//  SingleProductView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 03/07/2023.
//

import SwiftUI

struct SingleProductView: View {
    
    var product: Product
    @State var starFilled = false
    @StateObject private var favoriteViewModel = Favorites()
    
    var body: some View {
        HStack {
            VStack {
                Text(product.brand)
                    .fontWeight(.light)
                Text(product.title)
                    .padding(.leading)
                    .font(.headline)
                    
                Image(systemName: favoriteViewModel.savedItems.contains(product.id) ? "star.fill":"star")
                    .onTapGesture {
                        /* changeFavoriteStatus(product)
                         should add to favorites if it's not in favorites
                         should remove from favorites if in favorites
                         */
                        favoriteViewModel.changeFavStatus(product: product)
                        starFilled.toggle()
                    }
                .foregroundColor(.yellow)
                .padding(.top)
            }
            Spacer()
            VStack {
                Text(product.description)
                    .font(.subheadline)
                    .lineLimit(4)
                
                
                
                
            }
            thumbnailColumn()
        }
        .padding(.horizontal)
        .cornerRadius(10)
        
    }
    
    @ViewBuilder
    private func thumbnailColumn() -> some View {
        VStack{
            AsyncImage(url: product.thumbnail,scale: 4)
                .cornerRadius(10)
            
            Text("$\(product.price)")
                .foregroundColor(.green)
            
            
            // add star for favorites
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
        
        return SingleProductView(product: product)
    }
}

