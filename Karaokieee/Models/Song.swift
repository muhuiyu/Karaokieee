//
//  Song.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import Foundation

struct Song {
    let name: String
    let artist: String
    let lyrics: [Lyric]
    let fileName: String
}

extension Song {
    static let testEntries: [Song] = [
        Song(
            name: "Call me maybe",
            artist: "Carly Rae Jepsen",
            lyrics: [
                Lyric(time: LyricTime(minute: 0, second: 2, millisecond: 65), value: "I threw a wish in the well"),
                Lyric(time: LyricTime(minute: 0, second: 5, millisecond: 65), value: "Don't ask me, I'll never tell"),
                Lyric(time: LyricTime(minute: 0, second: 7, millisecond: 65), value: "I looked to you as it fell"),
                Lyric(time: LyricTime(minute: 0, second: 9, millisecond: 65), value: "And now you're in my way"),
                Lyric(time: LyricTime(minute: 0, second: 11, millisecond: 65), value: "I'd trade my soul for a wish"),
                Lyric(time: LyricTime(minute: 0, second: 13, millisecond: 65), value: "Pennies and dimes for a kiss "),
                Lyric(time: LyricTime(minute: 0, second: 15, millisecond: 65), value: "I wasn't looking for this"),
                Lyric(time: LyricTime(minute: 0, second: 17, millisecond: 65), value: "But now you're in my way "),
                Lyric(time: LyricTime(minute: 0, second: 20, millisecond: 40), value: "Your stare was holdin'"),
                Lyric(time: LyricTime(minute: 0, second: 21, millisecond: 65), value: "Ripped jeans, skin was showin'"),
                Lyric(time: LyricTime(minute: 0, second: 23, millisecond: 40), value: "Hot night, wind was blowin'"),
                Lyric(time: LyricTime(minute: 0, second: 25, millisecond: 40), value: "Where do you think you're going, baby?"),
                Lyric(time: LyricTime(minute: 0, second: 27, millisecond: 65), value: "Hey, I just met you"),
                Lyric(time: LyricTime(minute: 0, second: 29, millisecond: 40), value: "And this is crazy"),
                Lyric(time: LyricTime(minute: 0, second: 31, millisecond: 65), value: "But here's my number"),
                Lyric(time: LyricTime(minute: 0, second: 33, millisecond: 65), value: "So call me, maybe!"),
                Lyric(time: LyricTime(minute: 0, second: 35, millisecond: 90), value: "It's hard to look right"),
                Lyric(time: LyricTime(minute: 0, second: 37, millisecond: 65), value: "At you baby"),
                Lyric(time: LyricTime(minute: 0, second: 40, millisecond: 15), value: "But here's my number"),
                Lyric(time: LyricTime(minute: 0, second: 41, millisecond: 65), value: "So call me, maybe!"),
                
            ],
            fileName: "call-me-maybe.mp3"
        )
    ]
}
