//
//  StepsDetailCell.swift
//  Recipes
//
//  Created by Cristian Palomino on 11/11/23.
//

import Foundation
import RecipesUI
import SDWebImage
import UIKit

final class StepsDetailCell: UICollectionViewCell {
    static let identifier = "StepsDetailCell"

    var step: String? {
        didSet {
            stepLabel.text = step
        }
    }

    private lazy var stepLabel: UILabel = {
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
        stepLabel.pin(to: contentView)
    }
}
