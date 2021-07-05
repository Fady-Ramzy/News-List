//
//  NewsDetailsPresenter.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 05/07/2021.
//

import Foundation

protocol NewsDetailsPresenterProtocol {
    func updateUI()
}


class NewsDetailsPresenter {
    
    // MARK: - Properties
    
    private weak var view: NewsDetailsViewProtocol?
    private var news: NewsUIModel
    
    // MARK: - Initializers
    
    init(view: NewsDetailsViewProtocol, news: NewsUIModel) {
        self.view = view
        self.news = news
    }
}

// MARK: - extensions

extension NewsDetailsPresenter: NewsDetailsPresenterProtocol {
    func updateUI() {
        view?.updateUI(with: news)
    }
}
