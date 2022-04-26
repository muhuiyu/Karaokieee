//
//  SongDatabase.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import Foundation

class SongDatabase: NSObject {
    static let shared = SongDatabase()
    
    public func findSongs(with query: String, completion: @escaping(_ songs: [Song], _ error: Error?) -> Void) {
        // TODO: song search
        return completion(Song.testEntries, nil)
    }
}
