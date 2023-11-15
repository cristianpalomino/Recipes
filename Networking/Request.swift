//
//  Request.swift
//  Networking
//
//  Created by Cristian on 13/11/23.
//

import Foundation

public protocol RequestProtocol {
    associatedtype Response: Decodable

    var endpoint: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
}

public extension RequestProtocol {

    var headers: [String: String]? {
        return [:]
    }
}
