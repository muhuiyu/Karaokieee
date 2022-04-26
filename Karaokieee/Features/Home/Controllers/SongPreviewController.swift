//
//  SongPreviewController.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import UIKit
import RxSwift

class SongPreviewController: ViewController {
    private let titleLabel = UILabel()
    private let textView = UITextView()
    private let playButton = TextButton(buttonType: .primary)
        
    var name: String? {
        didSet {
            titleLabel.text = name
        }
    }
    var lyrics: String? {
        didSet {
            textView.text = lyrics
        }
    }
    var displayButtonText: String? {
        didSet {
            playButton.text = displayButtonText
        }
    }
    var tapHandler: (() -> Void)? {
        didSet {
            playButton.tapHandler = tapHandler
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
}
// MARK: - Actions
extension SongPreviewController {
    
}
// MARK: - View Config
extension SongPreviewController {
    private func configureViews() {
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.h3
        view.addSubview(titleLabel)
        
        textView.isEditable = false
        textView.textColor = .secondaryLabel
        textView.textAlignment = .center
        textView.font = UIFont.body
        textView.showsVerticalScrollIndicator = false
        view.addSubview(textView)
        view.addSubview(playButton)
    }
    private func configureConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.leading.trailing.top.equalTo(view.layoutMarginsGuide)
        }
        textView.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.spacing.medium)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalTo(view.layoutMarginsGuide)
        }
        playButton.snp.remakeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.layoutMarginsGuide)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}

