//
//  Networking.swift
//  Networking
//
//  Created by Cristian on 12/11/23.
//

import Foundation

public struct Client {
    public static let session: ClientProtocol = URLSessionClient()
    public static let alamofire: ClientProtocol = AlamofireClient()
}

public class Network {
    public typealias Domain = String

    private let domain: Domain
    private let client: ClientProtocol

    public init(
        domain: Domain,
        client: ClientProtocol
    ) {
        self.domain = domain
        self.client = client
    }

    public func send<Request: RequestProtocol>(
        _ request: Request,
        completion: @escaping ((Result<Request.Response, NetworkError>) -> Void)
    ) {
        guard let url = URL(string: "\(domain)\(request.endpoint)") else {
            completion(.failure(.invalidURL))
            return
        }

        client.makeRequest(
            url: url,
            method: request.method,
            completion: { result in
                switch result {
                case let .success(data):
                    let decoder = JSONDecoder()
                    do {
                        let response = try decoder.decode(Request.Response.self, from: data)
                        completion(.success(response))
                    } catch {
                        completion(.failure(.decoding(error)))
                    }
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        )
    }
}
