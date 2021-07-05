//
//  NewsRepository.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation

protocol NewsRepositoryProtocol {
    func fetchNews(with organization: String, from: String, to: String, completionHandler: @escaping (Result<Articles, Error>) -> Void)
}

class NewsRepository: NewsRepositoryProtocol {
    
    // MARK: - Methods
    
    func fetchNews(with organization: String, from: String, to: String, completionHandler: @escaping (Result<Articles, Error>) -> Void){
        APIClient.shared.startRequest(with: NewsRequest.list(organization: organization, from: from, to: to)) { result in
            switch result {
            case .success(let news):
                guard let articles = Articles(JSON: news as! [String: Any]) else { return }
                
                completionHandler(.success(articles))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
}
