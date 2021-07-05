//
//  NewsConfigurator.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation
import UIKit

protocol ConfiguratorProtocol {
    var viewcontroller: UIViewController { get }
}

enum NewsConfigurator: ConfiguratorProtocol {
    
    // MARK: - Cases
    
    case list
    case details(news: NewsUIModel)
    
    
    // MARK: - Properties
    
    var viewcontroller: UIViewController {
        switch self {
        case .list:
            let viewcontroller = NewsViewController()
            let repository = NewsRepository()
            let presenter = NewsPresenter(view: viewcontroller, repository: repository)
            viewcontroller.presenter  = presenter
            let navigationController = UINavigationController(rootViewController: viewcontroller)
            
            return navigationController
        case .details(let news):
            let viewcontroller = NewsDetailsViewController()
            let presenter = NewsDetailsPresenter(view: viewcontroller, news: news)
            viewcontroller.presenter = presenter
            
            return viewcontroller
        }
    }
}
