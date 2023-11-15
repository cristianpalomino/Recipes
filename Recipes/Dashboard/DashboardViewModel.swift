//
//  DashboardViewModel.swift
//  Recipes
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import RecipesCore
import RxSwift

protocol DashboardViewModelProtocol {
    var isLoadingObservable: Observable<LoadingUIModel> { get }
    var noDataObservable: Observable<NoDataUIModel> { get }
    var dashboardObservable: Observable<[SectionControllerProtocol]> { get }
    var didSelectRecipeObservable: Observable<RecipeDetailViewModel> { get }
    func didLoad()
}

final class DashboardViewModel: NSObject, DashboardViewModelProtocol {
    
    private let service: ServiceProtocol
    private let disposeBag = DisposeBag()
    
    lazy var isLoadingObservable: Observable<LoadingUIModel> = isLoadingSubject.asObservable()
    private lazy var isLoadingSubject = BehaviorSubject<LoadingUIModel>(value: .init(isLoading: true, title: "Loading... 😀"))
    lazy var noDataObservable: Observable<NoDataUIModel> = noDataSubject.asObservable()
    private lazy var noDataSubject = PublishSubject<NoDataUIModel>()
    lazy var dashboardObservable: Observable<[SectionControllerProtocol]> = dashboardSubject.asObservable()
    private lazy var dashboardSubject = PublishSubject<[SectionControllerProtocol]>()
    lazy var didSelectRecipeObservable: Observable<RecipeDetailViewModel> = didSelectRecipeSubject.asObservable()
    private lazy var didSelectRecipeSubject = PublishSubject<RecipeDetailViewModel>()
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func didLoad() {
        service.obtainRecipes().subscribe(
            onSuccess: { [weak self] dashboard in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.isLoadingSubject.onNext(.init(isLoading: false))
                    self.dispatchSuccess(dashboard)
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
    
    private func dispatchSuccess(_ dashboard: Dashboard) {
        if dashboard.isEmpty {
            noDataSubject.onNext(.init(image: .noDataBox, title: "Recipes not found 😟"))
            return
        }
        
        let topSection = DashboardTopSectionController(items: dashboard.top, delegate: self)
        let mostLikedSection = DashboardMostLikedSectionController(items: dashboard.mostLiked, delegate: self)
        let recipes = DashboardRecipesSectionController(items: dashboard.recipes, delegate: self)
        let sections: [SectionControllerProtocol] = [topSection, mostLikedSection, recipes]
        dashboardSubject.onNext(sections)
    }
    
    private func dispatchFailure(_ error: Error) {
        noDataSubject.onNext(.init(image: .noDataBox, title: error.localizedDescription))
    }
}

extension DashboardViewModel: SectionControllerDelegate {
    
    func didSelectItem(receiptID: String) {
        let viewModel = RecipeDetailViewModel(service: service, recipeID: receiptID)
        didSelectRecipeSubject.onNext(viewModel)
    }

    func didTapMap(location: Location) { }
}
