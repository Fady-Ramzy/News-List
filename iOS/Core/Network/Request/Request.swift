//
//  Request.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 05/07/2021.
//

import Foundation
import Alamofire

protocol Request {
    var path: String { get }
    var parameters: Parameters? { get }
    var httpMethod: HTTPMethod { get }
    var paramtersEncoding: ParameterEncoding { get }
    var httpHeaders: HTTPHeaders? { get }
    var queryParameters: [URLQueryItem]? { get }
}

