//
//  Articles.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 05/07/2021.
//

import Foundation
import ObjectMapper

struct Articles: Mappable {
    
    // MARK: - Properties
    
    var status: String?
    var totalResults: Int?
    var list: [News]?
    
    // MARK: - Initializers
    
    init(status: String?, totalResults: Int?, list: [News]?) {
        self.status = status
        self.totalResults = totalResults
        self.list = list
    }
    
    init?(map: Map) {}
    
    // MARK: - Mapping Methods
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        totalResults <- map["totalResults"]
        list <- map["articles"]
    }
}
