//
//  ChatGPTSearchRepository.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation
import Combine
import CoreNetwork

public final class ChatGPTSearchRepository: ChatGPTSearchRepositoryProtocol {
    private let networkServiceProtocol: NetworkServiceProtocol

    public init(networkServiceProtocol: NetworkServiceProtocol) {
        self.networkServiceProtocol = networkServiceProtocol
    }

    public func chatGPTSearchRepositoryProtocol(searchKeyword: String) -> AnyPublisher<ChatGPTSearchListEntity, Error> {
        networkServiceProtocol.request(.chatGPTSearch(searchKeyword: searchKeyword), type: ChatGPTSearchResDTO.self)
            .map { $0.toEntity() }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
