//
//  ImageLoader.swift
//  MovieList-SwiftUI
//
//  Created by Burak Şentürk on 14.01.2020.
//  Copyright © 2020 Burak Şentürk. All rights reserved.
//

import Combine
import Foundation

final class ImageLoader: ObservableObject {

    @Published var data = Data()

    init(url: String) {
        load(url: url)
    }

    private func load(url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            DispatchQueue.main.async {
                self.data = data
            }

        }.resume()
    }
}
