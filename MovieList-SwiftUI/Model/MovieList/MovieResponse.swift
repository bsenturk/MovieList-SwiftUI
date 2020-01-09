//
//  MovieResponse.swift
//  MovieList-SwiftUI
//
//  Created by Burak Şentürk on 8.01.2020.
//  Copyright © 2020 Burak Şentürk. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable {
    var id: Int64
    var imagePath: String?
    var title: String
    var overview: String

    enum CodingKeys: String, CodingKey {
        case id
        case imagePath = "poster_path"
        case title
        case overview
    }
}
