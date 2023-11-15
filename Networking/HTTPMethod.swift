//
//  HTTPMethod.swift
//  Networking
//
//  Created by Cristian on 13/11/23.
//

import Foundation
import Alamofire

public enum HTTPMethod: String {
    case get = "GET"

    func asAlamofireMethod() -> Alamofire.HTTPMethod {
        return Alamofire.HTTPMethod(rawValue: self.rawValue)
    }
}
