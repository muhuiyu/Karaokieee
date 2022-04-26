//
//  SearchViewModel.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import RxDataSources

class SearchViewModel {
    private let disposeBag = DisposeBag()
    
    var textFieldPlaceholder: String { return "Search song" }
    
    private let searchSubject = PublishSubject<String>()
    var searchObserver: AnyObserver<String> {
        return searchSubject.asObserver()
    }
    
    private let contentSubject = PublishSubject<[Video]>()
    var content: Driver<[Video]> {
        return contentSubject
            .asDriver(onErrorJustReturn: [])
    }
    
    var selectedVideo: BehaviorRelay<Video?> = BehaviorRelay(value: nil)
    
    // Song Preview Controller
    var displayPlayButtonText: String { return "Play" }
    var displaySongName: BehaviorRelay<String> = BehaviorRelay(value: "")
//    var displaySongLyrics: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    init() {
        searchSubject
            .asObservable()
            .filter { !$0.isEmpty }
            .distinctUntilChanged()
            .debounce(RxTimeInterval.microseconds(5), scheduler: MainScheduler.instance)
            .flatMapLatest { [unowned self] keyword -> Observable<[Video]> in
                return self.searchSongs(keyword)
            }
            .subscribe(onNext: { [unowned self] elements in
                self.contentSubject.onNext(elements)
            })
            .disposed(by: disposeBag)
        
        selectedVideo
            .asObservable()
            .subscribe(onNext: { value in
                if let value = value {
                    self.displaySongName.accept(value.title ?? "")
                }
            })
            .disposed(by: disposeBag)
    }
}
extension SearchViewModel {
    func searchSongs(_ keyword: String?) -> Observable<[Video]> {
        return Observable.create { observer in
            guard let text = keyword, !text.isEmpty else {
                return Disposables.create()
            }
            YouTubeFetchManager.shared.searchVideos(with: text) { videos, error in
                if let error = error {
                    print(error)
                    return
                }
                observer.onNext(videos)
            }
            return Disposables.create()
        }
    }
    func didSelectVideo(_ video: Video) {
        print("select")
        selectedVideo.accept(video)
    }
    func didDeselectVideo(_ video: Video) {
        selectedVideo.accept(nil)
    }
}

