//
//  NewsSource.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 05/07/2021.
//

import Foundation
import ObjectMapper

struct NewsSource: Mappable {
    
    // MARK: - Properties
    
    var id: String?
    var name: String?
    
    // MARK: Initilizer
    
    init?(map: Map) {}
    
    // MARK: - Mapping Methods
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
