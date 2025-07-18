//
//  ChatGPTSearchResDTO+Mapping.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation

extension ChatGPTSearchResDTO {
    public func toEntity() -> ChatGPTSearchListEntity {
        let results = choices
            .flatMap { $0.message.content.components(separatedBy: ",") }
            .map { ChatGPTSearchEntity(searchKeyword: $0.trimmingCharacters(in: .whitespacesAndNewlines)) }
        
        return ChatGPTSearchListEntity(results: results)
    }
}
