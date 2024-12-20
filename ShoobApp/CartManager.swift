//
//  CartManager.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product: Int] = [:] // Product.swift
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product) {
        if !products.keys.contains(product) {
            products[product] = 1
        } else {
            // the ! is a force unwrap operator, it is to unwrap Optional
            products[product]! += 1
        }
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        // filter out the product that is the product passed in
        let productQuantity = products[product]
        total -= (productQuantity ?? 0) * product.price
        products = products.filter { $0.key.id != product.id }
    }
}
