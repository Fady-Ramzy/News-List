//
//  NewsPresenter.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation



protocol NewsPresenterProtocol {
    var numberOfItems: Int { get }
    var newsUIModelList: [NewsUIModel] { set get }
    
    func didSelectNews(at index: Int)
    func fetchArticles()
}

class NewsPresenter {
    
    // MARK: - Properties
    
    private weak var view: NewsViewProtocol?
    private var repository: NewsRepositoryProtocol?
    var newsUIModelList: [NewsUIModel] = []
    
    // MARK: - Initializer
    
    init(view: NewsViewProtocol, repository: NewsRepositoryProtocol) {
        self.view = view
        self.repository = repository
    }
    
    // MARK: - Method
    
    func mapNewsToUIModel(with newsList: [News]?) -> [NewsUIModel] {
        guard let list = newsList else { return [] }
        
        return list.map({ news in
            return NewsUIModel(title: news.title, description: news.description, imageURL: URL(string: news.imageURL ?? ""))
        })
    }
}

// MARK: - extensions

extension NewsPresenter: NewsPresenterProtocol {
    var numberOfItems: Int {
        return newsUIModelList.count
    }
    
    // MARK: - Methods
    
    func didSelectNews(at index: Int) {
        view?.navigate(to: NewsRouter.details(news: newsUIModelList[index]))
    }
    
    func fetchArticles() {
        view?.showLoadingIndicator()
        repository?.fetchNews(with: "apple", from: "2021-07-04", to: "2021-07-04", completionHandler: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let articles):
                self.newsUIModelList =  self.mapNewsToUIModel(with: articles.list)
                self.view?.reloadData()
                case .failure(let error):
                    self.view?.showErrorPopup(with: error.localizedDescription)
            }
            self.view?.hideLoadingIndicator()
        })
    }
}
