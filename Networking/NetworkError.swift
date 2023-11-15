//
//  NetworkingError.swift
//  Networking
//
//  Created by Cristian on 13/11/23.
//

import Foundation

public enum NetworkError: Error {
    case client(_ data: Data?)
    case server(_ data: Data?)
    case unknown(_ error: Error? = nil)
    case decoding(_ error: Error)
    case noData
    case invalidURL
}
