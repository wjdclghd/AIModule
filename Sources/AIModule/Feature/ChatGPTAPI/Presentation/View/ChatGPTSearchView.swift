//
//  ChatGPTSearchView.swift
//  AIModule
//
//  Created by jch on 7/10/25.
//

import Foundation
import SwiftUI

public struct ChatGPTSearchView: View {
    @State private var searchKeyword: String = ""
    @StateObject private var viewModel: ChatGPTSearchViewModel

    init(viewModel: @autoclosure @escaping () -> ChatGPTSearchViewModel, onPush: @escaping (String) -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            TextField("검색어를 입력하세요", text: $searchKeyword)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    viewModel.chatGPTSearch(searchKeyword: searchKeyword)
                }

            ZStack {
                if viewModel.isLoading {
                    ProgressView("로딩 중...")
                } else if viewModel.chatGPTSearchResults.isEmpty {
                    Text("추천 결과가 없습니다.")
                        .foregroundColor(.gray)
                } else {
                    List(viewModel.chatGPTSearchResults) { entity in
                        Text(entity.searchKeyword)
                    }
                    .listStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
        }
        .navigationTitle("키워드 추천")
        .padding()
    }
}
