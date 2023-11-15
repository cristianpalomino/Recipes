//
//  DashboardViewModelTests.swift
//  RecipesTests
//
//  Created by Cristian on 10/11/23.
//

import XCTest
import RxSwift
import RecipesCore
@testable import Recipes

final class DashboardViewModelTests: XCTestCase {

    var viewModel: DashboardViewModel!
    var mockService: MockService!
    var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()
        mockService = MockService()
        viewModel = DashboardViewModel(service: mockService)
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        disposeBag = nil
        super.tearDown()
    }

    func testDidLoadSuccess() {
        let mockDashboard = Dashboard(top: [], mostLiked: [], recipes: [])
        mockService.mockObtainRecipesResult = mockDashboard

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

        XCTAssertEqual(mockService.mockObtainRecipesCount, 1)
    }

    func testDidLoadFailure() {
        let mockError = NSError(domain: "TestError", code: 1, userInfo: nil)
        mockService.mockObtainRecipesError = mockError

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

        XCTAssertEqual(mockService.mockObtainRecipesCount, 1)
    }
}
