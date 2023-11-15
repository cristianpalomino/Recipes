//
//  LoadingView.swift
//  RecipesUI
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import UIKit

public final class LoadingView: UIView {

    public var title: String? {
        didSet {
            label.text = title
        }
    }

    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()

        stack.addArrangedSubview(indicator)
        stack.addArrangedSubview(label)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
}

public extension LoadingView {
    
    func add(in view: UIView, withTitle title: String?) {
        pin(to: view)
        self.title = title
    }
}
