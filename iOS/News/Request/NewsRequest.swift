//
//  NewsRequest.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 05/07/2021.
//

import Foundation
import Alamofire

enum NewsRequest: Request {
    
    // MARK: - Cases
    
    case list(organization: String, from: String, to: String)
    
    // MARK: - Properties
  
    var path: String {
        switch self {
        case .list:
            return "https://newsapi.org/v2/everything"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .list:
            return nil
        }
    }
    
    var queryParameters: [URLQueryItem]? {
        switch self {
        case .list(let organization, let fromDate, let toDate):
            return [URLQueryItem(name: "q", value: organization),
                    URLQueryItem(name: "from", value: fromDate),
                    URLQueryItem(name: "to", value: toDate)]
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .list:
            return .get
        }
    }
    
    var paramtersEncoding: ParameterEncoding {
        switch self {
        case .list:
            return URLEncoding.default
        }
    }
    
    var httpHeaders: HTTPHeaders? {
        switch self {
        case .list:
            return nil
        }
    }
}
