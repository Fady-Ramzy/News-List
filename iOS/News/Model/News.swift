//
//  News.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation
import ObjectMapper

struct News: Mappable {
    
    // MARK: - Properties
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var imageURL: String?
    var publishAt: String?
    var content: String?
    
    // MARK: - Initializer
    
    init(author: String?, title: String?, description: String?, url: String?, imageURL: String?, publishAt: String?, content: String?) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.imageURL = imageURL
        self.publishAt = publishAt
        self.content = content
    }
    
    init?(map: Map) {}
    
    // MARK: - Mapping Methods
    
    mutating func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        imageURL <- map["urlToImage"]
        publishAt <- map["publishAt"]
        content <- map["content"]
    }
}
