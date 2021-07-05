//
//  LoadingIndicator.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation
import NVActivityIndicatorView

protocol LoadingIndicatorProtocol {

    // MARK: - Properties
    
    var loadingIndicator: UIView { get }
    
    // MARK: - Functions
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

extension LoadingIndicatorProtocol where Self: UIViewController {
    
    // MARK: - Properties
    
    var loadingIndicator: UIView {
        var nvActivityIndicatorView: NVActivityIndicatorView!
        
        guard let view = nvActivityIndicatorView else {
            nvActivityIndicatorView = NVActivityIndicatorView(frame: view.frame, type: .ballBeat, color: .gray)
            
            return nvActivityIndicatorView
        }
        
        return view
    }
    
    
    func showLoadingIndicator() {
        (loadingIndicator as? NVActivityIndicatorView)?.startAnimating()
    }
    
    func hideLoadingIndicator() {
        (loadingIndicator as? NVActivityIndicatorView)?.stopAnimating()
    }
}
