//
//  NewsViewController.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import UIKit

protocol NewsViewProtocol: NSObject {
    
}

class NewsViewController: UIViewController {

    // MARK: - Properties
    
    var presenter: NewsPresenterProtocol?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - extensions

extension NewsViewController: NewsViewProtocol {
    
}
