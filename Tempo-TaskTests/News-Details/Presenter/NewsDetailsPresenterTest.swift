//
//  NewsDetailsPresenterTest.swift
//  Tempo-TaskTests
//
//  Created by Fady Ramzy on 06/07/2021.
//

import XCTest
@testable import Tempo_Task

class NewsDetailsPresenterTest: XCTestCase {

    // MARK: - Properties
    
    var view: NewsDetailsViewMock!
    var presenter: NewsDetailsPresenter!
    var newsUIModel: NewsUIModel!
    
    // MARK: - Life Cycle
    
    override func setUpWithError() throws {
        newsUIModel = NewsUIModel(title: "Apple News", description: "Apple is a very good company", imageURL: URL(string: "URL1"))
        view = NewsDetailsViewMock()
        presenter = NewsDetailsPresenter(view: view, news: newsUIModel)
    }

    override func tearDownWithError() throws {
        newsUIModel = nil
        view = nil
        presenter = nil
    }
    
    // MARK: - Methods
    
    func test_updateUI_showUpdateUIWithUIModel() {
        // Given
        // When
        
        presenter.updateUI()
        
        // Then
        
        XCTAssertNotNil(newsUIModel.title)
        XCTAssertNotNil(newsUIModel.description)
        XCTAssertNotNil(newsUIModel.imageURL)
    }
}
