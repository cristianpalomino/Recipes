//
//  Recipe.swift
//  RecipesCore
//
//  Created by Cristian Palomino on 10/11/23.
//

import Foundation

public struct Recipe: Decodable {
    public let id: String
    public let name: String
    public let image: String
}
