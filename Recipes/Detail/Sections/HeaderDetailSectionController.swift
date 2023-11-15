//
//  DashboardMostLikedSectionController.swift
//  Recipes
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import UIKit
import RecipesCore

final class HeaderDetailSectionController: SectionControllerProtocol {

    weak var delegate: SectionControllerDelegate?
    let item: HeaderDetailUIModel

    init(item: HeaderDetailUIModel, delegate: SectionControllerDelegate) {
        self.item = item
        self.delegate = delegate
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderDetailCell.identifier, for: indexPath) as? HeaderDetailCell else {
            return UICollectionViewCell()
        }
        cell.title = item.name
        cell.subtitle = item.description
        cell.imageURL = URL(string: item.image)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }

    func createLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .none

        return section
    }
}
