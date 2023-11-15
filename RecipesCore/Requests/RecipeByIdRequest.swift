//
//  RecipeByIdRequest.swift
//  RecipesCore
//
//  Created by Cristian on 13/11/23.
//

import Foundation
import Networking

struct RecipeByIdRequest: RequestProtocol {
    typealias Response = RecipeDetail

    var method: HTTPMethod {
        return .get
    }

    var endpoint: String

    init(id: String) {
        self.endpoint = "/recipes/\(id)"
    }
}
