//
//  Configuration.swift
//  Networking
//
//  Created by Cristian on 13/11/23.
//

import Foundation

public protocol ClientProtocol {
    func makeRequest(
        url: URL,
        method: HTTPMethod,
        completion: @escaping ((Result<Data, NetworkError>) -> Void)
    )
}
