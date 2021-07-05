//
//  NewsTableViewCell.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    // MARK - IBOutlets
    
    @IBOutlet private weak var newsDescription: UILabel!
    @IBOutlet private weak var newsTitle: UILabel!
    @IBOutlet private weak var newsImageView: UIImageView!
    
    // MARK: - Methods
    
    func configure(with news: NewsUIModel?) {
        newsTitle.text = news?.title
        newsDescription.text = news?.description
        newsImageView.kf.setImage(with: news?.imageURL)
    }
}
