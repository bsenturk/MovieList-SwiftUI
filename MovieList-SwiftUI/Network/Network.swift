//
//  Network.swift
//  MovieList-SwiftUI
//
//  Created by Burak Şentürk on 8.01.2020.
//  Copyright © 2020 Burak Şentürk. All rights reserved.
//

import Combine
import Foundation

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
    case patch
}

protocol NetworkRequestType {
    associatedtype Response: Decodable

    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get set }
    var httpMethod: HTTPMethod { get }
}

extension NetworkRequestType {

    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.themoviedb.org"
    }
}

protocol NetworkServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, Error> where Request: NetworkRequestType
}

final class Network: NetworkServiceType{

    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, Error> where Request : NetworkRequestType {
        var urlComponents = URLComponents()
        urlComponents.scheme = request.scheme
        urlComponents.host = request.host
        urlComponents.path = request.path
        urlComponents.queryItems = request.queryItems

        let url = urlComponents.url!

        var request = URLRequest(url: url)
        request.httpMethod = request.httpMethod

        print("------------\(request)------------")

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return URLSession.shared.dataTaskPublisher(for: request)
            .map{ $0.data }
            .mapError { error in return error }
            .decode(type: Request.Response.self, decoder: decoder)
            .mapError { error in return error }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()

    }

}
