//
//  NoDataUIModel.swift
//  Recipes
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import UIKit

struct NoDataUIModel {

    let image: UIImage?
    let title: String

    init(image: UIImage?, title: String) {
        self.image = image
        self.title = title
    }
}
