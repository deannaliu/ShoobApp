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
    @State private var showMenu = false
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationStack {
            ZStack {
                if showMenu {
                    SideMenuView(isShowing: $showMenu)
                        .transition(.move(edge: .leading))
                        .zIndex(1) // Make sure the side menu is above the grid
                    }
                
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
                .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
                .toolbar {
                    // Menu button on the left
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            showMenu.toggle()  // Toggle the menu when pressed
                        }) {
                            Image(systemName: "line.horizontal.3") // Menu icon
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            CartView() // redirect to the cart view
                                .environmentObject(cartManager)
                        } label : {
                            // .count gets the number of products (array)
                            CartButton(numberOfProducts: cartManager.products.values.reduce(0, +))
                        }
                    }
                }
            }
        }
    }
}

// 'some' is an opaque type
// Opaque types allow you to describe the expected return type without defining a concrete type.
#Preview {
   ContentView()
}
