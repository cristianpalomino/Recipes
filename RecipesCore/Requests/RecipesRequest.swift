//
//  RecipesRequest.swift
//  RecipesCore
//
//  Created by Cristian on 13/11/23.
//

import Foundation
import Networking

struct RecipesRequest: RequestProtocol {
    typealias Response = Dashboard

    var endpoint: String {
        return "/recipes"
    }

    var method: HTTPMethod {
        return .get
    }
}
