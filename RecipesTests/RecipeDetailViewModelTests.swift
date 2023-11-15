//
//  RecipeDetailViewModelTests.swift
//  RecipesTests
//
//  Created by Cristian on 10/11/23.
//

import XCTest
import RxSwift
import RecipesCore
@testable import Recipes

final class RecipeDetailViewModelTests: XCTestCase {

    var viewModel: RecipeDetailViewModel!
    var mockService: MockService!
    var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()
        mockService = MockService()
        viewModel = RecipeDetailViewModel(service: mockService, recipeID: "Test")
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        disposeBag = nil
        super.tearDown()
    }

    func testDidLoadSuccess() {
        let detail = RecipeDetail(
            id: "Test",
            name: "Test",
            description: "Test",
            image: "Test",
            ingredients: [],
            steps: [],
            origin: .init(latitude: 1.1, longitude: 1.1)
        )
        mockService.mockObtainRecipeResult = detail

        let isLoadingExpectation = expectation(description: "isLoading should emit")
        viewModel.isLoadingObservable
            .subscribe(onNext: { loadingModel in
                if !loadingModel.isLoading {
                    isLoadingExpectation.fulfill()
                }
            })
            .disposed(by: disposeBag)

        viewModel.didLoad()

        waitForExpectations(timeout: 1.0, handler: nil)

        XCTAssertEqual(mockService.mockObtainRecipeCount, 1)
    }

    func testDidLoadFailure() {
        let mockError = NSError(domain: "TestError", code: 1, userInfo: nil)
        mockService.mockObtainRecipeError = mockError

        let isLoadingExpectation = expectation(description: "isLoading should emit")
        viewModel.isLoadingObservable
            .subscribe(onNext: { loadingModel in
                if !loadingModel.isLoading {
                    isLoadingExpectation.fulfill()
                }
            })
            .disposed(by: disposeBag)

        viewModel.didLoad()

        waitForExpectations(timeout: 1.0, handler: nil)

        XCTAssertEqual(mockService.mockObtainRecipeCount, 1)
    }
}
