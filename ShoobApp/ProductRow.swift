//
//  ProductRow.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import SwiftUI

// TODO: Implement duplicate item to show quantity?
// This is the row of item in the cart when added
struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var quantity: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name).bold()
                Text("$\(product.price)")
            }
            
            Spacer()
            
            Text("x\(quantity)")
            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }.padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productList[3], quantity: 2)
            .environmentObject(CartManager())
    }
}
