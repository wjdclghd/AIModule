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
    
    func testChatGPTSearchUseCaseProtocol() {
        let testExpectation = expectation(description: "TestChatGPTSearchUseCaseProtocol")

        testChatGPTSearchUseCase.chatGPTSearchUseCaseProtocol(searchKeyword: "TestChatGPTSearchKeyword")
            .sink(
                receiveCompletion: { testCompletion in
                    if case .failure(let testError) = testCompletion {
                        XCTFail("TestError: \(testError)")
                    }
                },
                receiveValue: { testResults in
                    XCTAssertEqual(testResults.count, 2)
                    XCTAssertEqual(testResults.first?.searchKeyword, "TestChatGPTSearchKeyword1")
                    XCTAssertEqual(testResults.last?.searchKeyword, "TestChatGPTSearchKeyword2")
                
                    testExpectation.fulfill()
            })
            .store(in: &testCancellables)

        wait(for: [testExpectation], timeout: 1.5)
    }

    func testChatGPTSearchUseCaseProtocolEmpty() {
        let testExpectation = expectation(description: "TestChatGPTSearchUseCaseProtocolEmpty")

        testChatGPTSearchUseCase.chatGPTSearchUseCaseProtocol(searchKeyword: " ")
            .sink(
                receiveCompletion: { testCompletion in
                    if case .failure(let testError) = testCompletion {
                        XCTFail("TestError: \(testError)")
                    }
                },
                receiveValue: { testResults in
                    XCTAssertTrue(testResults.isEmpty)
                
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
