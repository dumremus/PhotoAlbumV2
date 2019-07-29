//
//  PAStructs.swift
//  AsincDataLoaderTest
//
//  Created by Emanuel Dumitrescu on 28/07/2019.
//  Copyright © 2019 Emanuel Dumitrescu. All rights reserved.
//

import Foundation


public struct Album {
    var userId: Int
    var id: Int
    var title: String
    init(_ dictionary: [String: Any]) {
        self.userId = dictionary["userId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
    }
}


public struct Photo {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    init(_ dictionary: [String: Any]) {
        self.albumId = dictionary["albumId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.url = dictionary["url"] as? String ?? ""
        self.thumbnailUrl = dictionary["thumbnailUrl"] as? String ?? ""
    }
}


public struct Albums {
    var albumId: Int
    var titles: [String]
    var urls: [String]
    var thumbnailUrls: [String]
    init(_ dictionary: [String: Any]) {
        self.albumId = dictionary["albumId"] as? Int ?? 0
        self.titles = dictionary["titles"] as? [String] ?? [""]
        self.urls = dictionary["urls"] as? [String] ?? [""]
        self.thumbnailUrls = dictionary["thumbnailUrls"] as? [String] ?? [""]
    }
}
