//
//  MovieListRequest.swift
//  MovieList-SwiftUI
//
//  Created by Burak Şentürk on 8.01.2020.
//  Copyright © 2020 Burak Şentürk. All rights reserved.
//

import Foundation

final class MovieListRequest: NetworkRequestType {

    typealias Response = MovieResponse

    var queryItemArray: [URLQueryItem] = []

    var path: String {
        return "/3/movie/popular"
    }

    var queryItems: [URLQueryItem]? {
        get {
            return queryItemArray
        }
        set(newValue) {
            queryItemArray = newValue ?? []
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

}
