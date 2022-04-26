//
//  Video.swift
//  Karaokieee
//
//  Created by Mu Yu on 4/25/22.
//

import UIKit

struct Video {
    var id: String?
    var thumbnailImageURL: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

class Channel: NSObject {
    var title: String?
    var profileImageName: String?
}
