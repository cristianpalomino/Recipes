//
//  MockService.swift
//  RecipesTests
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import RxSwift
import RecipesCore

final class MockService: ServiceProtocol {
    var mockObtainRecipeResult: RecipeDetail?
    var mockObtainRecipeError: Error?
    var mockObtainRecipeCount = 0
    var mockObtainRecipesResult: Dashboard?
    var mockObtainRecipesError: Error?
    var mockObtainRecipesCount = 0

    func obtainRecipes() -> Single<Dashboard> {
        mockObtainRecipesCount += 1
        if let result = mockObtainRecipesResult {
            return Single.just(result)
        } else if let error = mockObtainRecipesError {
            return Single.error(error)
        } else {
            return Single.never()
        }
    }

    func obtainRecipe(by id: String) -> Single<RecipeDetail> {
        mockObtainRecipeCount += 1
        if let result = mockObtainRecipeResult {
            return Single.just(result)
        } else if let error = mockObtainRecipeError {
            return Single.error(error)
        } else {
            return Single.never()
        }
    }
}
