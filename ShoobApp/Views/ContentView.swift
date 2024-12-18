//
//  ContentView.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import SwiftUI

struct ContentView: View {
    // instantiate a CartManager Object
    @StateObject var cartManager = CartManager()
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            // allows the thing to scroll
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) {
                        product in ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Shoob Shop"))
            .toolbar {
                NavigationLink {
                    CartView() // redirect to the cart view
                } label : {
                    // .count gets the number of products (array)
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        // this is to fix some xcode bug?? 
    }
}

// 'some' is an opaque type
// Opaque types allow you to describe the expected return type without defining a concrete type.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
