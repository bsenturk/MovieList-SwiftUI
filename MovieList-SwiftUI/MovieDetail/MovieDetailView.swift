//
//  MovieDetailView.swift
//  MovieList-SwiftUI
//
//  Created by Burak Şentürk on 9.01.2020.
//  Copyright © 2020 Burak Şentürk. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
            VStack {
                Image("")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width - 40,
                           height: 300)
                    .background(Color.red)
                Text(movie.overview).padding(EdgeInsets(top: 0,
                                                          leading: 20,
                                                          bottom: 0,
                                                          trailing: 20))
                Spacer()
                }
            .navigationBarTitle(Text(movie.title),
                                displayMode: .inline)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(id: 0,
                                     imagePath: "",
                                     title: "",
                                     overview: ""))
    }
}
