//
//  MovieListView.swift
//  MovieList-SwiftUI
//
//  Created by Burak Şentürk on 8.01.2020.
//  Copyright © 2020 Burak Şentürk. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    var i: Int = 0
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        VStack {
                            ForEach(0..<self.viewModel.firstChunkedMovies.count, id: \.self) { movie in
                                NavigationLink(destination: MovieDetailView(movie: self.viewModel.firstChunkedMovies[movie],
                                                                            imageLoader: ImageLoader(url: "\(Constants.URL.baseImageUrl)\(self.viewModel.firstChunkedMovies[movie].imagePath)"))) {
                                                                                MovieListRow(movie: self.viewModel.firstChunkedMovies[movie],
                                                                                             imageLoader: ImageLoader(url: "\(Constants.URL.baseImageUrl)\(self.viewModel.firstChunkedMovies[movie].imagePath)"))
                                }
                            }
                        }

                        VStack {
                            ForEach(0..<self.viewModel.secondChunkedMovies.count, id: \.self) { movie in
                                NavigationLink(destination: MovieDetailView(movie: self.viewModel.secondChunkedMovies[movie],
                                                                            imageLoader: ImageLoader(url: "\(Constants.URL.baseImageUrl)\(self.viewModel.secondChunkedMovies[movie].imagePath)"))) {
                                                                                MovieListRow(movie: self.viewModel.secondChunkedMovies[movie],
                                                                                             imageLoader: ImageLoader(url: "\(Constants.URL.baseImageUrl)\(self.viewModel.secondChunkedMovies[movie].imagePath)"))
                                }
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }.frame(width: UIScreen.main.bounds.size.width)
            }
            .navigationBarTitle("Movies")
        }
        .onAppear { UITableView.appearance().separatorStyle = .none }
    }
}

struct Layout<Content>: View where Content: View {
    private let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        HStack {
            VStack {
                content()
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: .init())
    }
}
