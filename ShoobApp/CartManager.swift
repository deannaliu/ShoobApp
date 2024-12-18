//
//  CartManager.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []// Product.swift
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        // filter out the product that is the product passed in
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}
