//
//  HeaderDetailUIModel.swift
//  Recipes
//
//  Created by Cristian on 14/11/23.
//

import Foundation

struct HeaderDetailUIModel {
    let name: String
    let description: String
    let image: String
    
    init(name: String, description: String, image: String) {
        self.name = name
        self.description = description
        self.image = image
    }
}
