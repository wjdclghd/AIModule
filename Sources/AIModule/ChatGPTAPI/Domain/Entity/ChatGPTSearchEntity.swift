//
//  ChatGPTSearchEntity.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation

public struct ChatGPTSearchEntity: Identifiable, Codable, Hashable {
    public let searchKeyword: String
    public var id: String { searchKeyword }
}
