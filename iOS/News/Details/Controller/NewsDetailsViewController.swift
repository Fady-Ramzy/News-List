//
//  NewsDetailsViewController.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 05/07/2021.
//

import UIKit

protocol NewsDetailsViewProtocol: NSObject {
    func updateUI(with news: NewsUIModel)
}

class NewsDetailsViewController: UIViewController {

    // MARK: - IBOutlets
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - extensions

extension NewsViewController: NewsDetailsViewProtocol {
    func updateUI(with news: NewsUIModel) {
        
    }
}
