//
//  IngredientsDetailCell.swift
//  Recipes
//
//  Created by Cristian Palomino on 11/11/23.
//

import Foundation
import RecipesUI
import SDWebImage
import UIKit

final class IngredientsDetailCell: UICollectionViewCell {
    static let identifier = "IngredientsDetailCell"

    var ingredient: String? {
        didSet {
            ingredientLabel.text = ingredient
        }
    }

    private lazy var ingredientLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.textColor = .systemGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        ingredientLabel.pin(to: contentView)
    }
}
