//
//  APIClient.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation
import Alamofire

typealias APICompletionHandler = (Result<Any, AFError>) -> Void

protocol APIClientProtocol {
    func startRequest(with request: Request, completionHandler:  @escaping APICompletionHandler)
    func fullURL(from path: String, queryParameters: [URLQueryItem]?) -> URL
}

// MARK: - extensions

extension APIClientProtocol {
    
    // MARK: - Functions
    
    func startRequest(with request: Request, completionHandler:  @escaping APICompletionHandler) {
        AF.request(fullURL(from: request.path, queryParameters: request.queryParameters) , method: request.httpMethod, parameters: request.parameters, encoding: request.paramtersEncoding, headers: request.httpHeaders, interceptor: nil, requestModifier: nil).responseJSON { response in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}


class APIClient: APIClientProtocol {
    
    // MARK: - Properties
    
    private let apiKey = "apiKey"
    private let apiKeyValue = "72cdab8d5c0d44059eec30026785fc7a"
    private let sortByKey = "sortBy"
    private let sortByValue = "popularity"
    
    static let shared = APIClient()
    
    // MARK: - Initializers
    
    private init() {}
    
    // MARK: - Functions
    
    func fullURL(from path: String, queryParameters: [URLQueryItem]?) -> URL {
        var urlComponents = URLComponents(string: path)
        let apiKeyQueryParamter = URLQueryItem(name: apiKey, value: apiKeyValue)
        let sortByQueryParameter = URLQueryItem(name: sortByKey, value: sortByValue)
        urlComponents?.queryItems = [sortByQueryParameter, apiKeyQueryParamter]
        
        guard var components = urlComponents, let url = components.url else {
            return URL(string: path)!
        }
        
        guard queryParameters != nil, queryParameters?.isEmpty == false else {
            return url
        }
       
        guard components.query != nil, components.queryItems?.isEmpty == false else {
            return url
        }
        
        components.queryItems! += queryParameters ?? []
        
        return components.url!
    }
}
