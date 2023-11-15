//
//  RestService.swift
//  RecipesCore
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import RxSwift
import Networking

final class RestService: ServiceProtocol {
    enum RestServiceFailureReason: Error {
        case generic
    }

    private let client = Network(
        domain: "https://demo6920205.mockable.io",
        client: Client.session
    )

    func obtainRecipes() -> Single<Dashboard> {
        return Single<Dashboard>.create { [weak self] single in
            guard let self = self else {
                single(.failure(RestServiceFailureReason.generic))
                return Disposables.create()
            }

            let request = RecipesRequest()
            self.client.send(request) { result in
                switch result {
                case let .success(response):
                    return single(.success(response))
                case let .failure(error):
                    return single(.failure(error))
                }
            }

            return Disposables.create()
        }
    }

    func obtainRecipe(by id: String) -> Single<RecipeDetail> {
        return Single<RecipeDetail>.create { [weak self] single in
            guard let self = self else {
                single(.failure(RestServiceFailureReason.generic))
                return Disposables.create()
            }

            let request = RecipeByIdRequest(id: id)
            self.client.send(request) { result in
                switch result {
                case let .success(response):
                    return single(.success(response))
                case let .failure(error):
                    return single(.failure(error))
                }
            }

            return Disposables.create()
        }
    }
}
