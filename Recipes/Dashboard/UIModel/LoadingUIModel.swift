//
//  LoadingUIModel.swift
//  Recipes
//
//  Created by Cristian on 14/11/23.
//

import Foundation

struct LoadingUIModel {

    let isLoading: Bool
    let title: String?

    init(isLoading: Bool, title: String? = nil) {
        self.isLoading = isLoading
        self.title = title
    }
}
