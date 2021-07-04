//
//  NewsRouter.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation
import UIKit

protocol RouterProtocol {
    var presentationStyle: UIModalPresentationStyle { get }
    var viewcontroller: UIViewController { get }
}

enum NewsRouter: RouterProtocol {
    
    // MARK: - Cases
    
    case list
    
    // MARK: - Properties
    
    var presentationStyle: UIModalPresentationStyle {
        switch self {
        case .list:
            return .fullScreen
        }
    }
    
    var viewcontroller: UIViewController {
        switch self {
        case .list:
            return NewsConfigurator.list.viewcontroller
        }
    }
}
