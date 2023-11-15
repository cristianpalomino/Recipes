//
//  URLSessionClient.swift
//  Networking
//
//  Created by Cristian on 13/11/23.
//

import Foundation

final class URLSessionClient: ClientProtocol {

    func makeRequest(
        url: URL,
        method: HTTPMethod,
        completion: @escaping ((Result<Data, NetworkError>) -> Void)
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let task = Foundation.URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            
            guard let response = (response as? HTTPURLResponse)  else {
                completion(.failure(.unknown(nil)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            switch response.statusCode {
            case 200...299:
                completion(.success(data))
            case 400...499:
                completion(.failure(.client(data)))
            case 500...599:
                completion(.failure(.server(data)))
            default:
                completion(.failure(.unknown()))
            }
        }

        task.resume()
    }
}
