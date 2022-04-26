//
//  SearchResultCellViewModel.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import Foundation
import UIKit
import RxSwift
import RxRelay
import RxCocoa

class SearchResultCellViewModel {
    private let disposeBag = DisposeBag()
    
    // MARK: - Reactive properties
    var video: BehaviorRelay<Video?> = BehaviorRelay(value: nil)
//    var song: BehaviorRelay<Song> = BehaviorRelay(value: Song(name: "", lyrics: [], fileName: ""))
    
    var displayTitle: BehaviorRelay<String> = BehaviorRelay(value: "")
    var displaySubtitle: BehaviorRelay<String> = BehaviorRelay(value: "")
    var displayThumbnailImageURL: BehaviorRelay<String> = BehaviorRelay(value: "")

    init() {
        video
            .asObservable()
            .subscribe(onNext: { value in
                if let value = value {
                    self.displayTitle.accept(value.title ?? "")
                    self.displaySubtitle.accept(value.channel?.title ?? "")
                    self.displayThumbnailImageURL.accept(value.thumbnailImageURL ?? "")
                }
            })
            .disposed(by: disposeBag)
    }
}

extension SearchResultCellViewModel {
    
}

