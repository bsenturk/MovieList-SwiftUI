//
//  MovieListViewModel.swift
//  MovieList-SwiftUI
//
//  Created by Burak Şentürk on 8.01.2020.
//  Copyright © 2020 Burak Şentürk. All rights reserved.
//

import Combine
import Foundation

final class MovieListViewModel: ObservableObject {

    @Published private(set) var movies: [Movie] = []

    private let networkService: Network

    private let responseSubject = PassthroughSubject<MovieResponse, Never>()

    private var cancellables: [AnyCancellable] = []

    init(networkService: Network = Network()) {
        self.networkService = networkService

        bindInputs()
    }

    private func bindInputs() {
        let request = MovieListRequest()
        let queryItem = URLQueryItem(name: "api_key", value: "1850fa39fd78d321b331d47c4f03a223")
        request.queryItems?.append(queryItem)

        let responsePublisher = networkService.response(from: request)

        let subscriber = responsePublisher.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("finished..")
            case .failure(let error):
                debugPrint(error)
            }
        }, receiveValue: { value in
            self.movies = value.results
        })
        
        cancellables = [subscriber]

    }
}
