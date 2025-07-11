//
//  ChatGPTSearchUseCaseTests.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation
import XCTest
import Combine
@testable import AIModule

final class ChatGPTSearchUseCaseTests: XCTestCase {
    private var testChatGPTSearchRepository: TestChatGPTSearchRepository!
    private var testChatGPTSearchUseCase: ChatGPTSearchUseCaseProtocol!
    
    private var testCancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        testChatGPTSearchRepository = TestChatGPTSearchRepository()
        testChatGPTSearchUseCase = ChatGPTSearchUseCase(repository: testChatGPTSearchRepository)
        
        testCancellables = []
    }
    
    override func tearDownWithError() throws {
        testChatGPTSearchUseCase = nil
        testChatGPTSearchRepository = nil
        
        testCancellables = nil
    }
    
    func testChatGPTSearchUseCaseSuccess() {
        let testExpectation = expectation(description: "TestChatGPTSearchUseCase")

        testChatGPTSearchUseCase.chatGPTSearchUseCaseProtocol(searchKeyword: "TestChatGPTSearchKeyword")
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    XCTFail("Success: \(error)")
                }
            }, receiveValue: { results in
                XCTAssertEqual(results.count, 2)
                XCTAssertEqual(results.first?.searchKeyword, "TestChatGPTSearchKeyword1")
                XCTAssertEqual(results.last?.searchKeyword, "TestChatGPTSearchKeyword2")
                testExpectation.fulfill()
            })
            .store(in: &testCancellables)

        wait(for: [testExpectation], timeout: 1.5)
    }

    func testChatGPTSearchUseCaseFail() {
        let testExpectation = expectation(description: "TestChatGPTSearchUseCase")

        testChatGPTSearchUseCase.chatGPTSearchUseCaseProtocol(searchKeyword: "   ")
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    XCTFail("Fail: \(error)")
                }
            }, receiveValue: { results in
                XCTAssertTrue(results.isEmpty)
                testExpectation.fulfill()
            })
            .store(in: &testCancellables)

        wait(for: [testExpectation], timeout: 1.5)
    }
}

final class TestChatGPTSearchRepository: ChatGPTSearchRepositoryProtocol {
    func chatGPTSearchRepositoryProtocol(searchKeyword: String) -> AnyPublisher<ChatGPTSearchListEntity, Error> {
        let testResults = ChatGPTSearchListEntity(results: [
            ChatGPTSearchEntity(searchKeyword: "TestChatGPTSearchKeyword1"),
            ChatGPTSearchEntity(searchKeyword: "TestChatGPTSearchKeyword2")
        ])
        
        return Just(testResults)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
