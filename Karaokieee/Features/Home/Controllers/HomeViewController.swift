//
//  HomeViewController.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import UIKit

class HomeViewController: ViewController {
    
    var viewModel = HomeViewModel()
    
    private let searchBar = UISearchBar()
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
}
// MARK: - View Config
extension HomeViewController {
    private func configureViews() {
        title = viewModel.title
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search song"
        navigationItem.searchController = searchController
        
        definesPresentationContext = true
    }
    private func configureConstraints() {
        
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}

// MARK: - Search Result Updating
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}
