//
//  TopReceiptCell.swift
//  Recipes
//
//  Created by Cristian Palomino on 11/11/23.
//

import Foundation
import RecipesUI
import SDWebImage
import UIKit

final class TopReceiptCell: UICollectionViewCell {
    static let identifier = "TopReceiptCell"

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

    private lazy var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()

    private lazy var titleLabel: Label = {
        let titleLabel = Label()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.textColor = .systemGray6
        titleLabel.backgroundColor = UIColor.systemBrown.withAlphaComponent(0.8)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
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
        backgroundImageView.pin(to: contentView, constant: 1)

        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addBorders()
    }

    private func addBorders() {
        titleLabel.layer.cornerRadius = 4
        backgroundImageView.layer.cornerRadius = 8
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray.cgColor
    }
}
