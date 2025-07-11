//
//  ChatGPTSearchUseCase.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation
import Combine

public final class ChatGPTSearchUseCase: ChatGPTSearchUseCaseProtocol {
    private let repository: ChatGPTSearchRepositoryProtocol

    public init(repository: ChatGPTSearchRepositoryProtocol) {
        self.repository = repository
    }

    public func chatGPTSearchUseCaseProtocol(searchKeyword: String) -> AnyPublisher<[ChatGPTSearchEntity], Error> {
        let trimmedSearchKeyword = searchKeyword.trimmingCharacters(in: .whitespaces)
        
        guard !trimmedSearchKeyword.isEmpty else {
            return Just([])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return repository.chatGPTSearchRepositoryProtocol(searchKeyword: trimmedSearchKeyword)
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}
