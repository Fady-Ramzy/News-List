//
//  NewsRepositoryMock.swift
//  Tempo-TaskTests
//
//  Created by Fady Ramzy on 05/07/2021.
//

import Foundation
@testable import Tempo_Task

class NewsRepositoryMock: NewsRepositoryProtocol {
    
    // MARK: - Properties
    
    var fetchNewsApiResult: Result<Articles, Error>!
    
    // MARK: - Methods
    
    func fetchNews(with organization: String, from: String, to: String, completionHandler: @escaping (Result<Articles, Error>) -> Void) {
        completionHandler(fetchNewsApiResult)
    }
}
