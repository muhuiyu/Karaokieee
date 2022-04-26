//
//  Lyric.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import Foundation

struct Lyric {
    let time: LyricTime
    let value: String
}

struct LyricTime {
    let minute: Int
    let second: Int
    let millisecond: Int
}
