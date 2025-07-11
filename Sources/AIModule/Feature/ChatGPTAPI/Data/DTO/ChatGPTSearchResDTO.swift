//
//  ChatGPTSearchResponseDTO.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation

public struct ChatGPTSearchResDTO : Decoder {
    public let choices: [Choice]
    
    public struct Choice: Decoder {
        public let message: Message
        
        public struct Message: Decodable {
            public let role: String
            public let content: String
        }
        
        public let index: Int
        public let finish_reason: String
    }
    
    public let id: String
    public let object: String
    public let created: Int
    public let model: String
    public let usage: Usage
    
    public struct Usage: Decoder {
        public let prompt_tokens: Int
        public let completion_tokens: Int
        public let total_totens: Int
    }
}
