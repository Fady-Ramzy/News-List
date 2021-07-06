//
//  NewsPresenterTest.swift
//  Tempo-TaskTests
//
//  Created by Fady Ramzy on 05/07/2021.
//

@testable import Tempo_Task
import XCTest
import Alamofire

class NewsPresenterTest: XCTestCase {
    
    // MARK: - Properties
    
    var view: NewsViewMock!
    var presenter: NewsPresenter!
    var repository: NewsRepositoryMock!
    var newsList: [News]!
    var articles: Articles!
    
    enum NetworkErrorMock: Error {
        case missingURL
        case connectionURL
    }
    
    // MARK: - Life cycle
    
    override func setUpWithError() throws {
        newsList = [News(author: "Author1", title: "title 1", description: "Description 1", url: "url 1", imageURL: "url 1", publishAt: "publish 1", content: "Content 1")]
        articles = Articles(status: "Ok", totalResults: 29, list: newsList)
        view = NewsViewMock()
        repository = NewsRepositoryMock()
        presenter = NewsPresenter(view: view, repository: repository)
    }
    
    override func tearDownWithError() throws {
        articles = nil
        newsList = nil
        view = nil
        presenter = nil
        repository = nil
    }
    
    // MARK: - Methods
    
    func test_showLoadingIndictor_shouldShowLoadingIndicator() {
        // Given
        // When
        presenter.showLoadingIndicator()
        
        // Then
        
        XCTAssertTrue(view.didShowLoadingIndicator)
    }
    
    func test_hideLoadingIndicator_shouldHideLoadingIndicator() {
        // Given
        // When
        presenter.hideLoadingIndicator()
        
        // Then
        
        XCTAssertTrue(view.didHideLoadingIndicator)
    }
    
    func test_reloadData_shouldReloadData() {
        // Given
        // When
        presenter.reloadData()
        
        // Then
        
        XCTAssertTrue(view.didReloadData)
    }
    
        func test_didSelectItemAtIndex_shouldNavigateToNewsDetails() {
            // Given
            
            presenter.newsUIModelList = [NewsUIModel(title: "title1", description: "description1", imageURL: nil)]
            
            // When
    
            presenter.didSelectNews(at: 0)
    
            // Then
    
            XCTAssertTrue(view.didNavigate)
        }
    
    func test_fetchNews_shouldShowLoadingIndicator() {
        // Given
        
        repository.fetchNewsApiResult = .success(articles)
        
        // When
        
        presenter.fetchArticles()
        
        // Then
        
        XCTAssertTrue(view.didShowLoadingIndicator)
    }
    
    func test_fetchNews_whenAPIReturnsSuccess_shouldReloadData() {
        // Given
        
        repository.fetchNewsApiResult = .success(articles)
        
        // When
        
        presenter.fetchArticles()
        
        // Then
        
        XCTAssertTrue(view.didReloadData)
        
    }
    
    func test_fetchNews_whenAPIReturnsSuccess_shouldMapNewsToUIModel() {
        // Given
        
        repository.fetchNewsApiResult = .success(articles)
        
        // When
        
        presenter.fetchArticles()
        
        // Then
        
        XCTAssertEqual(presenter.newsUIModelList.count, 1)
    }
    
    func test_fetchNews_whenAPIReturnsSuccess_shouldHideLoadingIndicator() {
        // Given
        
        repository.fetchNewsApiResult = .success(articles)
        
        // When
        
        presenter.fetchArticles()
        
        // Then
        
        XCTAssertTrue(view.didHideLoadingIndicator)
    }
    
    
    func test_fetchNews_whenAPIReturnsFailure_shouldShowErrorPopup() {
        // Given
        
        repository.fetchNewsApiResult = .failure(NetworkErrorMock.connectionURL)
        
        // When
        
        presenter.fetchArticles()
        
        // Then
        
        XCTAssertTrue(view.didShowErrorPopup)
    }
    
    
    func test_fetchNews_whenAPIReturnsFailure_shouldHideLoadingIndicator() {
        // Given
        
        repository.fetchNewsApiResult = .failure(NetworkErrorMock.connectionURL)
        
        // When
        
        presenter.fetchArticles()
        
        // Then
        
        XCTAssertTrue(view.didHideLoadingIndicator)
    }
    
}
