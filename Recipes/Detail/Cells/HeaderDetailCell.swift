//
//  HeaderDetailCell.swift
//  Recipes
//
//  Created by Cristian Palomino on 11/11/23.
//

import Foundation
import RecipesUI
import SDWebImage
import UIKit

final class HeaderDetailCell: UICollectionViewCell {
    static let identifier = "HeaderDetailCell"

    var imageURL: URL? {
        didSet {
            guard let url = imageURL else { return }
            backgroundImageView.sd_setImage(
                with: url,
                placeholderImage: .placeHolder)
        }
    }

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
        }
    }

    private lazy var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.textColor = .systemGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .left
        subtitleLabel.textColor = .systemGray
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        let stack = UIStackView(arrangedSubviews: [backgroundImageView, titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.spacing = 4
        contentView.addSubview(stack)

        stack.pin(to: contentView, constant: 8)
        backgroundImageView.heightAnchor.constraint(equalToConstant: 135).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addBorders()
    }

    private func addBorders() {
        backgroundImageView.layer.cornerRadius = 8
    }
}
