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
    var url: URL?
    var imageURL: URL?
    var publishAt: String?
    var content: String?
    
    // MARK: - Initializer
    
    init?(map: Map) {}
    
    // MARK: - Mapping Methods
    
    mutating func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        imageURL <- map["imageURL"]
        publishAt <- map["publishAt"]
        content <- map["content"]
    }
}
