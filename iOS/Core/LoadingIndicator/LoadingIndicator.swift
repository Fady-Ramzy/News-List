//
//  LoadingIndicator.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation
import NVActivityIndicatorView

protocol LoadingIndicatorProtocol {
    // MARK: - Functions
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

extension LoadingIndicatorProtocol where Self: UIViewController {
    
    // MARK: - Properties
    
    func showLoadingIndicator() {
        let nvActivityIndicatorView = NVActivityIndicatorView(frame: view.frame, type: .ballBeat, color: .blue)
        nvActivityIndicatorView.startAnimating()
        view.addSubview(nvActivityIndicatorView)
    }
    
    func hideLoadingIndicator() {
        view.subviews.forEach { view in
            if view is NVActivityIndicatorView {
                (view as? NVActivityIndicatorView)?.stopAnimating()
            }
        }
    }
}
