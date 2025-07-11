//
//  ChatGPTSearchViewModelTests.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation
import XCTest
import Combine
@testable import AIModule

final class ChatGPTSearchViewModelTests: XCTestCase {
    private var testChatGPTSearchUseCase: TestChatGPTSearchUseCase!
    private var testChatGPTSearchViewModel: ChatGPTSearchViewModel!
    
    private var testCancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        testChatGPTSearchUseCase = TestChatGPTSearchUseCase()
        testChatGPTSearchViewModel = ChatGPTSearchViewModel(useCase: testChatGPTSearchUseCase)
        
        testCancellables = []
    }
    
    override func tearDownWithError() throws {
        testChatGPTSearchUseCase = nil
        testChatGPTSearchViewModel = nil
        
        testCancellables = nil
    }
    
    func testChatGPTSearchResultsSuccess() {
        let testExpectation = expectation(description: "TestChatGPTSearchViewModel")
        let testSearchKeyword = ["TestChatGPTSearchKeyword1", "TestChatGPTSearchKeyword2"]

        testChatGPTSearchViewModel.$chatGPTSearchResults
            .dropFirst()
            .sink { results in
                XCTAssertEqual(results.count, 2)
                XCTAssertEqual(results.first?.searchKeyword, "TestChatGPTSearchKeyword1")
                XCTAssertEqual(results.last?.searchKeyword, "TestChatGPTSearchKeyword2")
                
                testExpectation.fulfill()
            }
            .store(in: &testCancellables)

        testChatGPTSearchViewModel.chatGPTSearch(searchKeyword: "testChatGPTSearchKeyword")

        wait(for: [testExpectation], timeout: 1.5)
    }
}

final class TestChatGPTSearchUseCase: ChatGPTSearchUseCaseProtocol {
    func chatGPTSearchUseCaseProtocol(searchKeyword: String) -> AnyPublisher<[ChatGPTSearchEntity], Error> {
        let testResults: [ChatGPTSearchEntity] = [
            ChatGPTSearchEntity(searchKeyword: "TestChatGPTSearchKeyword1"),
            ChatGPTSearchEntity(searchKeyword: "TestChatGPTSearchKeyword2")
        ]
        
        return Just(testResults)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
