//
//  Dashboard.swift
//  RecipesCore
//
//  Created by Cristian on 14/11/23.
//

import Foundation

public struct Dashboard: Decodable {
    
    public let top: [Recipe]
    public let mostLiked: [Recipe]
    public let recipes: [Recipe]

    public init(top: [Recipe], mostLiked: [Recipe], recipes: [Recipe]) {
        self.top = top
        self.mostLiked = mostLiked
        self.recipes = recipes
    }

    enum CodingKeys: String, CodingKey {
        case top
        case mostLiked = "most_liked"
        case recipes
    }
}

public extension Dashboard {

    var isEmpty: Bool {
        return top.isEmpty && mostLiked.isEmpty && recipes.isEmpty
    }
}
