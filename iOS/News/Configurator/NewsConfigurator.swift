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
    
    // MARK: - Properties
    
    var viewcontroller: UIViewController {
        switch self {
        case .list:
            let newsViewController = NewsViewController()
            let presenter = NewsPresenter(view: newsViewController)
            newsViewController.presenter  = presenter
            
            return newsViewController
        }
    }
}
