//
//  ProductCard.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    @State var isFavorite: Bool = false
    @State private var scale: CGFloat = 1.0 // Track the scale for the animation
    
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
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .bold()
                        Text("$\(product.price)")
                            .font(.caption) // format for price with $
                    }
                    Spacer() // this pushes the button to the right
                    VStack {
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isFavorite.toggle()
                                scale = isFavorite ? 1.2 : 1.0
                            }
                        } label: {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .scaleEffect(scale)
                                .animation(.easeInOut(duration: 0.2), value: scale)
                        }
                    }
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

#Preview {
    ProductCard(product: productList[0])
        .environmentObject(CartManager())
}
