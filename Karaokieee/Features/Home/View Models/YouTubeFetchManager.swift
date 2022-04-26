//
//  YouTubeFetchManager.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import Foundation
import UIKit

class YouTubeFetchManager: NSObject {
    static let shared = YouTubeFetchManager()
    
    static private let apiKey = "AIzaSyAySzNkiiI28f8tjXWwpp1FAG25rDaXi6s"
    
    enum error: Error {
        case dataMissing
        case urlInvalid
    }
    
    public func searchVideos(with query: String, completion: @escaping(_ videos: [Video], _ error: Error?) -> Void) {
        let processedQuery = query.replacingOccurrences(of: " ", with: "+")
        
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&fields=items(id,snippet(title,channelTitle,thumbnails))&order=viewCount&q=\(processedQuery)&type=video&maxResults=25&key=\(YouTubeFetchManager.apiKey)"
        
        guard let url = URL(string: urlString) else { return completion([], YouTubeFetchManager.error.urlInvalid) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return completion([], YouTubeFetchManager.error.dataMissing) }
            
            if let _ = error {
                return completion([], error)
            }
            do {
                guard
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject],
                    let items = json["items"] as? [[String: AnyObject]]
                else { return completion([], nil) }
                var videos = [Video]()

                for dictionary in items {
                    print(dictionary)
                    guard
                        let id = dictionary["id"]?["videoId"] as? String,
                        let title = dictionary["snippet"]?["title"] as? String,
                        let thumbnailImageURL = ((dictionary["snippet"]?["thumbnails"] as! Dictionary<String, AnyObject>)["default"] as! Dictionary<String, AnyObject>)["url"] as? String,
                        let channelTitle = dictionary["snippet"]?["channelTitle"] as? String
                    else { return completion([], nil) }
                    
                    // TODO: use video ID to fetch Channel ID, view count
                    let channel = Channel()
                    channel.title = channelTitle
//                    channel.profileImageName = channelProfileImageName

                    let video = Video(id: id, thumbnailImageURL: thumbnailImageURL, title: title, numberOfViews: nil, uploadDate: nil, channel: channel)
                    videos.append(video)
                }
                return completion(videos, nil)

            } catch let jsonError {
                return completion([], jsonError)
            }
            
        }.resume()
    }
}
