//
//  Food.swift
//  EasyAllergies
//
//  Created by Michael Klein on 5/14/21.
//

import Foundation

struct Item: Codable {
    var name: String
    var brand: String
    var ingredients: String
    var diet_labels: Diet_labels?
}

struct Diet_labels: Codable {
    var vegan: Vegan?
    var vegetarian: Vegetarian?
    var gluten_free: Gluten_free?
}

struct Vegan: Codable {
    var is_compatible: Bool?
}

struct Vegetarian: Codable {
    var is_compatible: Bool?
}

struct Gluten_free: Codable {
    var is_compatible: Bool?
}
