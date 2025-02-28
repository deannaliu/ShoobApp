//
//  Product.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import Foundation

// TODO: perhaps how much of the product in stock? is that on database?
struct Product: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var quantity: Int
}

var productList: [Product] = [Product(name: "Red Shoob", image: "red sheeb", price: 100, quantity: 1),
                              Product(name: "Black Shoob", image: "black sheeb", price: 1000, quantity: 1),
                              Product(name: "White Shoob", image: "white sheeb", price: 500, quantity:1),
                              Product(name: "Akita Inu", image: "akita sheeb", price: 5000, quantity: 1)]
