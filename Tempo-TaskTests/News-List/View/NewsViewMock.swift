//
//  NewsViewMock.swift
//  Tempo-TaskTests
//
//  Created by Fady Ramzy on 05/07/2021.
//

import Foundation
import UIKit
@testable import Tempo_Task


class NewsViewMock: NSObject, NewsViewProtocol {
    
    // MARK: - Properties
    
    var didShowLoadingIndicator: Bool = false
    var didHideLoadingIndicator: Bool = false
    var didReloadData: Bool = false
    var didShowErrorPopup: Bool = false
    var didNavigate: Bool = false
    
    // MARK: - Methods
    
    func showErrorPopup(with errorMessage: String) {
        didShowErrorPopup = true
    }
    
    func showLoadingIndicator() {
        didShowLoadingIndicator = true
    }
    
    func hideLoadingIndicator() {
        didHideLoadingIndicator = true
    }
    
    func navigate(to router: RouterProtocol) {
        didNavigate = true
    }
    
    func reloadData() {
        didReloadData = true
    }
}
