//
//  HomeViewController.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import UIKit
import RxSwift

class HomeViewController: ViewController {
    
    private let disposeBag = DisposeBag()
    
    var viewModel = HomeViewModel()
    var searchViewModel = SearchViewModel()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()
    
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
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        title = viewModel.title
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = searchViewModel.textFieldPlaceholder
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.reuseID)
        view.addSubview(tableView)
    }
    private func configureConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        searchController.searchBar
            .rx
            .text
            .orEmpty
            .bind(to: self.searchViewModel.searchObserver)
            .disposed(by: disposeBag)
        
        
        searchViewModel
            .content
            .drive(tableView.rx.items(cellIdentifier: SearchResultCell.reuseID)) { indexPath, item, cell in
                guard let cell = cell as? SearchResultCell else { return }
                cell.viewModel.video.accept(item)
            }
            .disposed(by: disposeBag)
        
        Observable
            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(Video.self))
            .subscribe { indexPath, item in
                self.searchViewModel.didSelectVideo(item)
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
            .disposed(by: disposeBag)

        searchViewModel.selectedVideo
            .asObservable()
            .subscribe(onNext: { value in
                if let value = value {
                    self.didSelectVideo(value)
                }
            })
            .disposed(by: disposeBag)
    }
}
// MARK: - Actions
extension HomeViewController {
    func didSelectVideo(_ video: Video) {
        let viewController = VideoPlayerViewController()
        viewController.id = video.id
        navigationController?.pushViewController(viewController, animated: true)
    }
//    func didStartSong(_ song: Song) {
//        self.dismiss(animated: true) {
//            let viewController = RoomViewController()
//            viewController.viewModel.selectedSong.accept(song)
//            self.navigationController?.pushViewController(viewController, animated: true)
//        }
//    }
}

// MARK: - Search Result Updating
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}
