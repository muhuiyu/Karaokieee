//
//  RoomViewModel.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import Foundation
import RxSwift
import RxRelay

class RoomViewModel {
    private let disposeBag = DisposeBag()
    var selectedSong: BehaviorRelay<Song?> = BehaviorRelay(value: nil)
    var displayName: BehaviorRelay<String> = BehaviorRelay(value: "")
    var displayLyrics: BehaviorRelay<[Lyric]> = BehaviorRelay(value: [])
    
    init() {
        
    }
}

extension RoomViewModel {
    
}

