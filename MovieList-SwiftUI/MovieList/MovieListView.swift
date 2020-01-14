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
    var body: some View {
        NavigationView {
                List(viewModel.movies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie,
                                                                imageLoader: ImageLoader(url: "\(Constants.URL.baseImageUrl)\(movie.imagePath)"))) {
                                                                    MovieListRow(movie: movie,
                                                                                 imageLoader: ImageLoader(url: "\(Constants.URL.baseImageUrl)\(movie.imagePath)"))
                    }
                }
                .navigationBarTitle("Movies")
        }
        .onAppear { UITableView.appearance().separatorStyle = .none }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: .init())
    }
}
