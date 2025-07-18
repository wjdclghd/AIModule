//
//  ChatGPTSearchUseCaseProtocol.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation
import Combine

public protocol ChatGPTSearchUseCaseProtocol{
    func chatGPTSearchUseCaseProtocol(searchKeyword: String) -> AnyPublisher<[ChatGPTSearchEntity], Error>
}
