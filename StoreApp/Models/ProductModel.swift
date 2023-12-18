//
//  ProductModel.swift
//  StoreApp
//
//  Created by Macbook Air 13 on 18.12.23.
//

import Foundation

struct ProductsResponse: Decodable {
    let products: [Product]
}

struct Product: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
