//
//  MovieDetailView.swift
//  MovieList-SwiftUI
//
//  Created by Burak Şentürk on 9.01.2020.
//  Copyright © 2020 Burak Şentürk. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        VStack {
            Image("")
            .resizable()
                .frame(width: UIScreen.main.bounds.size.width,
                       height: 300)
                .background(Color.red)

            Text("Movie Overview")
            Spacer()
        }

    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
