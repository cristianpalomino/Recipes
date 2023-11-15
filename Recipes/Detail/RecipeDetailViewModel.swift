//
//  RecipeDetailViewModel.swift
//  Recipes
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import RecipesCore
import RxSwift

protocol RecipeDetailViewModelProtocol {
    var isLoadingObservable: Observable<LoadingUIModel> { get }
    var noDataObservable: Observable<NoDataUIModel> { get }
    var recipeDetailObservable: Observable<[SectionControllerProtocol]> { get }
    var showMapObservable: Observable<Location> { get }
    func didLoad()
}

final class RecipeDetailViewModel: NSObject, RecipeDetailViewModelProtocol {

    private let service: ServiceProtocol
    private let recipeID: String
    private let disposeBag = DisposeBag()

    lazy var isLoadingObservable: Observable<LoadingUIModel> = isLoadingSubject.asObservable()
    private lazy var isLoadingSubject = BehaviorSubject<LoadingUIModel>(value: .init(isLoading: true, title: "Loading... 😀"))
    lazy var noDataObservable: Observable<NoDataUIModel> = noDataSubject.asObservable()
    private lazy var noDataSubject = PublishSubject<NoDataUIModel>()
    lazy var recipeDetailObservable: Observable<[SectionControllerProtocol]> = recipeDetailSubject.asObservable()
    private lazy var recipeDetailSubject = PublishSubject<[SectionControllerProtocol]>()
    lazy var showMapObservable: Observable<Location> = showMapSubject.asObservable()
    private lazy var showMapSubject = PublishSubject<Location>()

    init(service: ServiceProtocol, recipeID: String) {
        self.service = service
        self.recipeID = recipeID
    }

    func didLoad() {
        service.obtainRecipe(by: recipeID).subscribe(
            onSuccess: { [weak self] recipe in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.isLoadingSubject.onNext(.init(isLoading: false))
                    self.dispatchSuccess(recipe)
                }
            },
            onFailure: { [weak self] error in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.isLoadingSubject.onNext(.init(isLoading: false))
                    self.dispatchFailure(error)
                }
            }
        ).disposed(by: disposeBag)
    }

    private func dispatchSuccess(_ recipe: RecipeDetail) {
        let headerSection = HeaderDetailSectionController(
            item: .init(name: recipe.name, description: recipe.description, image: recipe.image),
            delegate: self
        )
        let ingredientsSection = IngredientsDetailSectionController(items: recipe.ingredients, delegate: self)
        let stepSection = StepsDetailSectionController(items: recipe.steps, delegate: self)
        let mapSection = MapDetailSectionController(item: recipe.origin, delegate: self)
        let sections: [SectionControllerProtocol] = [headerSection, mapSection, ingredientsSection, stepSection]
        recipeDetailSubject.onNext(sections)
    }

    private func dispatchFailure(_ error: Error) {
        noDataSubject.onNext(.init(image: .noDataBox, title: error.localizedDescription))
    }
}

extension RecipeDetailViewModel: SectionControllerDelegate {

    func didTapMap(location: Location) {
        showMapSubject.onNext(location)
    }

    func didSelectItem(receiptID: String) { }
}


