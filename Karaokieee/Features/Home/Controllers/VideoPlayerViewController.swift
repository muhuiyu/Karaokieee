//
//  VideoPlayerViewController.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import UIKit
import WebKit
import AVFoundation
import YouTubeiOSPlayerHelper

class VideoPlayerViewController: ViewController {
    
    private let playerView = YTPlayerView()
    
//    var viewModel = <#ViewModel#>()
    
    var id: String? {
        didSet {
            guard let id = id else { return }
            playerView.load(withVideoId: id)
        }
    }
    
    private var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureGestures()
        configureSignals()
    }
}
// MARK: - Setup Player
extension VideoPlayerViewController {
    private func configurePlayerView() {
        
    }
}
// MARK: - View Config
extension VideoPlayerViewController {
    private func configureViews() {
        view.addSubview(playerView)
    }
    private func configureConstraints() {
        playerView.snp.remakeConstraints { make in
            make.leading.top.trailing.equalTo(view.layoutMarginsGuide)
            make.height.equalTo(playerView.snp.width).multipliedBy(0.6)
        }
    }
    private func configureGestures() {
        
    }
    private func configureSignals() {
        
    }
}

