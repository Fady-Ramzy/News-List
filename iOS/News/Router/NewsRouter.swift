//
//  NewsRouter.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation
import UIKit

enum NewsRouter: RouterProtocol {
    
    // MARK: - Cases
    
    case list
    case details(news: NewsUIModel)
    
    // MARK: - Properties
    
    var navigationStyle: NavigationStyle {
        switch self {
        case .list, .details:
            return .push(animated: true)
        }
    }
    
    var destinationViewController: UIViewController {
        switch self {
        case .list:
            return NewsConfigurator.list.viewcontroller
        case .details(let news):
            return NewsConfigurator.details(news: news).viewcontroller
        }
    }
}
