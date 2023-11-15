//
//  NoDataView.swift
//  RecipesUI
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import UIKit

public final class NoDataView: UIView {

    public var title: String? {
        didSet {
            label.text = title
        }
    }

    public var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }

    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    public init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        translatesAutoresizingMaskIntoConstraints = false

        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(label)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
}

public extension NoDataView {

    func add(in view: UIView, withTitle title: String, image: UIImage?) {
        self.pin(to: view)
        self.title = title
        self.image = image
    }
}
