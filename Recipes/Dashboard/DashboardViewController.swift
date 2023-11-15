//
//  DashboardViewController.swift
//  Recipes
//
//  Created by Cristian Palomino on 10/11/23.
//

import Foundation
import UIKit
import RxSwift
import RecipesUI

final class DashboardViewController: UIViewController {

    private let viewModel: DashboardViewModelProtocol
    private let disposeBag = DisposeBag()

    private var datasource: [SectionControllerProtocol] = []

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private lazy var loadingView: LoadingView = {
        let loadingView = LoadingView()
        return loadingView
    }()

    private lazy var noDataView: NoDataView = {
        let noDataView = NoDataView()
        return noDataView
    }()

    init(viewModel: DashboardViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setup()
        registerCells()
        viewModel.didLoad()
    }

    private func setup() {
        title = "Recipes"
        view.backgroundColor = .systemBackground
    }

    private func bind() {
        disposeBag.insert(
            viewModel.isLoadingObservable.subscribe(onNext: { [weak self] model in
                guard let self else { return }
                self.dispatchIsLoadingObservable(model)
            }),
            viewModel.noDataObservable.subscribe(onNext: { [weak self] model in
                guard let self else { return }
                self.dispatchNoDataObservable(model)
            }),
            viewModel.dashboardObservable.subscribe(onNext: { [weak self] sections in
                guard let self else { return }
                self.dispatchDashboardObservable(sections)
            }),
            viewModel.didSelectRecipeObservable.subscribe(onNext: { [weak self] viewModel in
                guard let self else { return }
                self.dispatchSelectRecipeObservable(viewModel)
            })
        )
    }

    private func registerCells() {
        collectionView.register(TopReceiptCell.self, forCellWithReuseIdentifier: TopReceiptCell.identifier)
    }

    private func dispatchIsLoadingObservable(_ model: LoadingUIModel) {
        if model.isLoading {
            loadingView.add(in: self.view, withTitle: model.title)
        } else {
            loadingView.removeFromSuperview()
        }
    }

    private func dispatchNoDataObservable(_ model: NoDataUIModel) {
        noDataView.add(in: self.view, withTitle: model.title, image: .noDataBox)
    }

    private func dispatchDashboardObservable(_ sections: [SectionControllerProtocol]) {
        noDataView.removeFromSuperview()
        collectionView.pin(to: view)
        setupCompositionalLayout(sections)
    }

    private func dispatchSelectRecipeObservable(_ viewModel: RecipeDetailViewModel) {
        let viewController = RecipeDetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }

    private func setupCompositionalLayout(_ sections: [SectionControllerProtocol]) {
        datasource = sections
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
            return sections[sectionIndex].createLayoutSection()
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.reloadData()
    }
}

extension DashboardViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datasource.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource[section].collectionView(collectionView, numberOfItemsInSection: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return datasource[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
}

extension DashboardViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        datasource[indexPath.section].collectionView(collectionView, didSelectItemAt: indexPath)
    }
}
