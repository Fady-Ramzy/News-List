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
    
    // MARK: - Initializer
    
    init(view: NewsViewProtocol) {
        self.view = view
    }
    
}

// MARK: - extensions

extension NewsPresenter: NewsPresenterProtocol {
    
}
