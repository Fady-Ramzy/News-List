//
//  Router.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 05/07/2021.
//

import Foundation
import UIKit

enum NavigationStyle {
    case push(animated: Bool)
    case presentModally(presentationStyle: UIModalPresentationStyle, animated: Bool, completion: (() -> Void)?)
}

protocol RouterProtocol {
    var navigationStyle: NavigationStyle { get }
    var destinationViewController: UIViewController { get }
}
