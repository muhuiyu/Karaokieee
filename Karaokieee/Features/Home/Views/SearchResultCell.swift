//
//  SearchResultCell.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import UIKit
import RxSwift

class SearchResultCell: UITableViewCell {
    private let thumbnailImageView = UIImageView()
    private let userProfileImageView = UIImageView()
    private let separatorView = UIView()
    private let titleLabel = UILabel()
    private let subtitleTextView = UITextView()
    
    static let reuseID = NSStringFromClass(SearchResultCell.self)
    
    var viewModel = SearchResultCellViewModel()
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - View Config
extension SearchResultCell {
    private func configureViews() {
        thumbnailImageView.backgroundColor = .blue
        contentView.addSubview(thumbnailImageView)
        
        userProfileImageView.backgroundColor = .red
        contentView.addSubview(userProfileImageView)
        
        separatorView.backgroundColor = .black
        contentView.addSubview(separatorView)
        
        titleLabel.text = "default"
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.body
        contentView.addSubview(titleLabel)
        
        subtitleTextView.text = "this is my subtitle"
        subtitleTextView.textColor = .secondaryLabel
        subtitleTextView.backgroundColor = .red
        subtitleTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleTextView)
        
        contentView.backgroundColor = .secondarySystemBackground
        backgroundColor = .secondarySystemBackground
    }
    private func configureConstraints() {
        thumbnailImageView.snp.remakeConstraints { make in
            make.leading.top.trailing.equalTo(contentView.layoutMarginsGuide)
            make.height.equalTo(thumbnailImageView.snp.width).multipliedBy(0.7)
        }
        userProfileImageView.snp.remakeConstraints { make in
            make.top.equalTo(thumbnailImageView.snp.bottom).offset(Constants.spacing.small)
            make.leading.equalTo(thumbnailImageView)
            make.size.equalTo(Constants.avatarImageSize.medium)
        }
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(userProfileImageView)
            make.leading.equalTo(userProfileImageView.snp.trailing).offset(Constants.spacing.small)
            make.trailing.equalTo(contentView.layoutMarginsGuide)
        }
        subtitleTextView.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.spacing.small)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalTo(contentView.layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        viewModel.displayTitle.subscribe(onNext: { value in
            self.titleLabel.text = value
        }).disposed(by: disposeBag)
        
        viewModel.displaySubtitle.subscribe(onNext: { value in
            self.subtitleTextView.text = value
        }).disposed(by: disposeBag)
        
        viewModel.displayThumbnailImageURL.subscribe(onNext: { value in
            self.thumbnailImageView.loadImageUsingUrlString(urlString: value)
        }).disposed(by: disposeBag)

    }
}

