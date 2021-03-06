//
//  MovieListRow.swift
//  MovieList-SwiftUI
//
//  Created by Burak Şentürk on 9.01.2020.
//  Copyright © 2020 Burak Şentürk. All rights reserved.
//

import SwiftUI

struct MovieListRow: View {
    @State var movie: Movie
    @ObservedObject var imageLoader: ImageLoader

    var body: some View {
        HStack {
            VStack(spacing: 10) {
                Image(uiImage: UIImage(data: imageLoader.data) ?? UIImage())
                    .resizable()
                    .frame(width: 150, height: 250)
                    .background(Color.red)
                Text(movie.title)
                    .lineLimit(1)
            }
            .frame(width: 150)
        }
    }
}

struct MovieListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRow(movie: Movie(id: 1,
                                  imagePath: "",
                                  title: "",
                                  overview: ""),
                     imageLoader: ImageLoader(url: ""))
    }
}
