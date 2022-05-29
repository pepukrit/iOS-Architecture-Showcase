//
//  Product.swift
//  SwiftUIMVVMApp (iOS)
//
//  Created by Ukrit Wattanakulchart on 29/5/2565 BE.
//

import Foundation

struct Model: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}

