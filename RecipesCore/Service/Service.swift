//
//  RecipesService.swift
//  RecipesCore
//
//  Created by Cristian on 13/11/23.
//

import Foundation
import RxSwift

public struct Services {
    public static let live: ServiceProtocol = RestService()
    public static let mock: ServiceProtocol = MockService()
}

public protocol ServiceProtocol {
    func obtainRecipes() -> Single<Dashboard>
    func obtainRecipe(by id: String) -> Single<RecipeDetail>
}
