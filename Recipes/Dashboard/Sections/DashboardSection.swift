//
//  Sections.swift
//  Recipes
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import UIKit
import RecipesCore

protocol SectionControllerDelegate: NSObject {
    func didSelectItem(receiptID: String)
    func didTapMap(location: Location)
}

protocol SectionControllerProtocol {
    var delegate: SectionControllerDelegate? { get }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    func createLayoutSection()-> NSCollectionLayoutSection
}
