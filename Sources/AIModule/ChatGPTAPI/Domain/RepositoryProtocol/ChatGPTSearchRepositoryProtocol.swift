//
//  ChatGPTSearchRepositoryProtocol.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation
import Combine

public protocol ChatGPTSearchRepositoryProtocol {
    func chatGPTSearchRepositoryProtocol(searchKeyword: String) -> AnyPublisher<ChatGPTSearchListEntity, Error>
}
