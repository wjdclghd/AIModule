//
//  ChatGPTSearchRepositoryTests.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation
import XCTest
import Combine
@testable import AIModule
@testable import CoreNetwork

final class ChatGPTSearchRepositoryTests: XCTestCase {
    /*
    private var testNetworkService: TestNetworkService!
    private var testChatGPTSearchRepository: ChatGPTSearchRepository!
    
    private var testCancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        testNetworkService = TestNetworkService()
        testChatGPTSearchRepository = ChatGPTSearchRepository(repository: testNetworkService)
        
        testCancellables = []
    }
    
    override func tearDownWithError() throws {
        testNetworkService = nil
        testChatGPTSearchRepository = nil
        
        testCancellables = nil
    }
    
    func testChatGPTSearchRepositoryReturns() {
        let testExpectation = expectation(description: "TestChatGPTSearchRepositoryReturns")

        let dto = ChatGPTSearchResDTO(results: [
            ChatGPTSearchResDTO.Result(searchKeyword: "TestChatGPTSearchKeyword1"),
            ChatGPTSearchResDTO.Result(searchKeyword: "TestChatGPTSearchKeyword2")
        ])
        
        testNetworkService.stubbedResponse = .success(dto)

        testChatGPTSearchRepository.chatGPTSearchRepositoryProtocol(searchKeyword: "TestChatGPTSearchKeyword")
            .sink(
                receiveCompletion: { testCompletion in
                    if case .failure(let testError) = testCompletion {
                        XCTFail("TestError: \(testError)")
                    }
                },
                receiveValue: { entity in
                    XCTAssertEqual(entity.results.count, 2)
                    XCTAssertEqual(entity.results.first?.searchKeyword, "TestChatGPTSearchKeyword1")
                    XCTAssertEqual(entity.results.last?.searchKeyword, "TestChatGPTSearchKeyword2")
                    
                    testExpectation.fulfill()
            })
            .store(in: &testCancellables)

        wait(for: [testExpectation], timeout: 1.5)
    }
}

final class TestNetworkService: NetworkServiceProtocol {
    func request<T>(_ endpoint: APIEndpoint, type: T.Type) -> AnyPublisher<T, NetworkError> where T: Decodable, T: Sendable {
        let dto = ChatGPTSearchResDTO(results: [
            ChatGPTSearchResDTO.Result(searchKeyword: "TestChatGPTSearchKeyword1"),
            ChatGPTSearchResDTO.Result(searchKeyword: "TestChatGPTSearchKeyword2")
        ])
        
        if let testData = dto as? T {
            return Just(testData)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: NetworkError.decodingError)
                .eraseToAnyPublisher()
        }
    }
     */
}
