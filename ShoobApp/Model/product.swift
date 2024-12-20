//
//  Product.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/17/24.
//

import Foundation

struct Product: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList: [Product] = [Product(name: "Red Shoob", image: "red sheeb", price: 100),
                   Product(name: "Black Shoob", image: "black sheeb", price: 1000),
                   Product(name: "White Shoob", image: "white sheeb", price: 500),
                   Product(name: "Akita Inu", image: "akita sheeb", price: 5000)]
