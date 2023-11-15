//
//  AlamofireClient.swift
//  Networking
//
//  Created by Cristian on 13/11/23.
//

import Foundation
import Alamofire

final class AlamofireClient: ClientProtocol {

    func makeRequest(
        url: URL,
        method: HTTPMethod,
        completion: @escaping ((Result<Data, NetworkError>) -> Void)
    ) {
        AF.request(url, method: method.asAlamofireMethod()).responseData { afresponse in
            if let error = afresponse.error {
                completion(.failure(.unknown(error.underlyingError)))
                return
            }

            guard let response = afresponse.response else {
                completion(.failure(.unknown(nil)))
                return
            }

            guard let data = afresponse.data else {
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
    }
}

