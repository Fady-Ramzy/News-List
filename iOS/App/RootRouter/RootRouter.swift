//
//  RootRouter.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 06/07/2021.
//

import Foundation
import UIKit

enum RootRouter: RouterProtocol {
    
    case root
    
    var navigationStyle: NavigationStyle {
        switch self {
        case .root:
            return .push(animated: true)
        }
        
    }
    
    var destinationViewController: UIViewController {
        switch self {
        case .root:
            return NewsConfigurator.list.viewcontroller
        }
    }
}
