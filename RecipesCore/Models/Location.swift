//
//  Location.swift
//  RecipesCore
//
//  Created by Cristian Palomino on 10/11/23.
//

import Foundation

public struct Location: Decodable {
    public let latitude: Double
    public let longitude: Double

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
