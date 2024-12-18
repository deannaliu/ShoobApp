//
//  ContentView.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import SwiftUI

struct ContentView: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            // allows the thing to scroll
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) {
                        product in ProductCard(product: product)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Shoob Shop"))
            .toolbar {
                // TODO: Change to Dynamic Number
                CartButton(numberOfProducts: 1)
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
