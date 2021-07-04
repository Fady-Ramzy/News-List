//
//  NewsPresenter.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation

protocol NewsPresenterProtocol {}

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
    
}
