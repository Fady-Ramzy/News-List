//
//  NewsDetailsViewController.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 05/07/2021.
//

import UIKit
import Kingfisher

protocol NewsDetailsViewProtocol: NSObject {
    func updateUI(with news: NewsUIModel)
}

class NewsDetailsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var newsTitle: UILabel!
    @IBOutlet private weak var newsDescription: UILabel!
    
    // MARK: - Properties
    
    var presenter: NewsDetailsPresenterProtocol?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.updateUI()
        navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - extensions

extension NewsDetailsViewController: NewsDetailsViewProtocol {
    func updateUI(with news: NewsUIModel) {
        newsImageView.kf.setImage(with: news.imageURL)
        newsTitle.text = news.title
        newsDescription.text = news.description
    }
}
