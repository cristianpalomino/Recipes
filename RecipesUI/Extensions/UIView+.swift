//
//  UIView+.swift
//  RecipeUI
//
//  Created by Cristian on 11/11/23.
//

import UIKit

public extension UIView {

    func pin(to parent: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(self)

        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -constant),
            self.topAnchor.constraint(equalTo: parent.topAnchor, constant: constant),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -constant)
        ])
    }
}

public extension NSCollectionLayoutSection {

    static var empty: NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(
            widthDimension: .absolute(0),
            heightDimension: .absolute(0)
        )
        let group = NSCollectionLayoutGroup(layoutSize: size)
        return NSCollectionLayoutSection(group: group)
    }
}
