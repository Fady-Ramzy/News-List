//
//  NewsDetailsViewMock.swift
//  Tempo-TaskTests
//
//  Created by Fady Ramzy on 06/07/2021.
//

import Foundation
@testable import Tempo_Task

class NewsDetailsViewMock: NSObject, NewsDetailsViewProtocol {
    
    // MARk: - Properties
    
    var newsTitle: String?
    var newsDescription: String?
    var newsImageURL: URL?
    
    // MARK: - Methods
    
    func updateUI(with news: NewsUIModel) {
        newsTitle = news.title
        newsDescription = news.description
        newsImageURL = news.imageURL
    }
}
