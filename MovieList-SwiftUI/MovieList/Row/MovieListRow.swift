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
    var body: some View {
        HStack {
        VStack(spacing: 10) {
            Image("")
            .resizable()
            .frame(width: 150, height: 250)
                .background(Color.red)
            Text(movie.title)
            .lineLimit(2)
            }

            Spacer()

            VStack(spacing: 10) {
                Image("")
                .resizable()
                .frame(width: 150, height: 250)
                    .background(Color.red)
                Text(movie.title)
                .lineLimit(2)
            }


            }.padding(EdgeInsets(top: 0,
                                 leading: 10,
                                 bottom: 0,
                                 trailing: 10))
    }
}

struct MovieListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRow(movie: Movie(id: 1,
                                  imagePath: nil,
                                  title: "",
                                  overview: ""))
    }
}
