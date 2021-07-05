//
//  NewsPresenter.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation

protocol NewsPresenterProtocol {
    func fetchArticles()
}

class NewsPresenter {
    
    // MARK: - Properties
    
    weak var view: NewsViewProtocol?
    var repository: NewsRepositoryProtocol?
    
    // MARK: - Initializer
    
    init(view: NewsViewProtocol, repository: NewsRepositoryProtocol) {
        self.view = view
        self.repository = repository
    }
}

// MARK: - extensions

extension NewsPresenter: NewsPresenterProtocol {
    
    // MARK: - Methods
    
    func fetchArticles() {
        view?.showLoadingIndicator()
        repository?.fetchNews(with: "apple", from: "2021-07-04", to: "2021-07-04", completionHandler: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let articles): break
                case .failure(let error): break
            }
            self.view?.hideLoadingIndicator()
        })
    }
}
