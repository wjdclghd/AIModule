//
//  ChatGPTSearchListEntity.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation

public struct ChatGPTSearchListEntity: Codable {
    public let resultCount: Int
    public let results: [ChatGPTSearchEntity]
    
    public init(results: [ChatGPTSearchEntity]) {
        self.resultCount = results.count
        self.results = results
    }
}
