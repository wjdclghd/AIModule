//
//  ChatGPTSearchViewModel.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation
import Combine

public final class ChatGPTSearchViewModel: ObservableObject {
    @Published private(set) var chatGPTSearchResults: [ChatGPTSearchEntity] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String? = nil

    private let useCase: ChatGPTSearchUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    public init(useCase: ChatGPTSearchUseCaseProtocol) {
        self.useCase = useCase
    }

    public func chatGPTSearch(searchKeyword: String) {
        isLoading = true
        errorMessage = nil

        useCase
            .chatGPTSearchUseCaseProtocol(searchKeyword: searchKeyword)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    
                    if case let .failure(error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] results in
                    self?.chatGPTSearchResults = results
                })
            .store(in: &cancellables)
    }

//    public func chatGPTClear() {
//        self.searchKeyword = ""
//        self.errorMessage = nil
//        self.chatGPTSearchResults = []
//    }
}
