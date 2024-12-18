//
//  ProductCard.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    
    // https://sarunw.com/posts/how-to-resize-swiftui-image-and-keep-aspect-ratio/
    var product: Product
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180)
                    .clipped()
                    .cornerRadius(20)
                    .allowsHitTesting(false)
                // the cropped image, blocks the buttons in main view
                // .allowsHitTesting ignores the current view
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    Text("$\(product.price)")
                        .font(.caption) // format for price with $
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial) // a preview gray
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding() // padding around the + circle
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
