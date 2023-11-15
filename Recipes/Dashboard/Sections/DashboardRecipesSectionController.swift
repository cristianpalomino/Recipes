//
//  DashboardRecipesSectionController.swift
//  Recipes
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import UIKit
import RecipesCore

final class DashboardRecipesSectionController: SectionControllerProtocol {

    weak var delegate: SectionControllerDelegate?
    let items: [Recipe]

    init(items: [Recipe], delegate: SectionControllerDelegate) {
        self.items = items
        self.delegate = delegate
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopReceiptCell.identifier, for: indexPath) as? TopReceiptCell else {
            return UICollectionViewCell()
        }
        let model = items[indexPath.row]
        cell.imageURL = URL(string: model.image)
        cell.title = model.name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = items[indexPath.row]
        delegate?.didSelectItem(receiptID: model.id)
    }

    func createLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .none
        
        return section
    }
}
