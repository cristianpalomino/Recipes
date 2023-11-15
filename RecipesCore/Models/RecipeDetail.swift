//
//  RecipeDetail.swift
//  RecipesCore
//
//  Created by Cristian on 13/11/23.
//

import Foundation

public struct RecipeDetail: Decodable {
    public let id: String
    public let name: String
    public let description: String
    public let image: String
    public let ingredients: [Ingredient]
    public let steps: [String]
    public let origin: Location

    public init(id: String, name: String, description: String, image: String, ingredients: [Ingredient], steps: [String], origin: Location) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.ingredients = ingredients
        self.steps = steps
        self.origin = origin
    }
}
