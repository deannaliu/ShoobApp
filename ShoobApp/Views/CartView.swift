//
//  CartView.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                //ForEach(cartManager.products, id: \.id) {
                //    product in ProductRow(product: product.keys)
                //}
                
                ForEach(Array(cartManager.products.keys), id: \.self) { key in
                    if let quantity = cartManager.products[key] {
                            ProductRow(product: key, quantity: quantity)
                    }
                }
                HStack {
                    Text("Your cart total is:")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                PaymentButton(action: {})
                    .padding()
            } else {
                Text ("Empty Cart")
                    .bold()
                    .font(.system(size: 30))
                Spacer()
                Text ("Start adding Shoobs!")
            }
        }
        .navigationTitle(Text("Cart of Shoobs"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
