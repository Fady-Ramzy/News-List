//
//  NavigationRoute.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 05/07/2021.
//

import Foundation
import UIKit

protocol NavigationRoute {
    func navigate(to router: RouterProtocol)
}

extension NavigationRoute where Self: UIViewController {
    func navigate(to router: RouterProtocol) {
        switch router.navigationStyle {
        case .push(let animated):
            navigationController?.pushViewController(router.destinationViewController, animated: animated)
        case .presentModally(let presentationStyle, let animated, let completion):
            let presentedViewController = router.destinationViewController
            presentedViewController.modalPresentationStyle = presentationStyle
            present(presentedViewController, animated: animated, completion: completion)
        }
    }
}
