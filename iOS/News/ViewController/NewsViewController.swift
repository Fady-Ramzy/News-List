//
//  NewsViewController.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import UIKit

protocol NewsViewProtocol: LoadingIndicatorProtocol, NSObject {
    func reloadData()
    func showErrorPopup(with errorMessage: String)
}

class NewsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private let tableViewCellIdentifier = "NewsTableViewCell"
    var presenter: NewsPresenterProtocol?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.fetchArticles()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: Bundle(for: NewsViewController.self)), forCellReuseIdentifier: "NewsTableViewCell")
    }
}

// MARK: - extensions

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Navigate to the news details
    }
    	
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: presenter?.newsUIModelList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems ?? 0
    }

}

extension NewsViewController: NewsViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
    func showErrorPopup(with errorMessage: String) {
        let alertViewController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertViewController.addAction(alertAction)
        
        present(alertViewController, animated: true, completion: nil)
    }
}
