//
//  ContentView.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ForEach(productList, id: \.id) {
            product in ProductCard(product: product)
        }
    }
}

// 'some' is an opaque type
// Opaque types allow you to describe the expected return type without defining a concrete type.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
